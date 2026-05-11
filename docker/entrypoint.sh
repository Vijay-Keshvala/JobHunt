#!/bin/sh
set -e

cd /var/www/html

# Render and other hosts inject PORT; default for local docker run
PORT="${PORT:-8080}"

DB_CONNECTION="${DB_CONNECTION:-sqlite}"

# Aiven (and many clouds) require TLS. PDO needs a *file path* for MYSQL_ATTR_SSL_CA.
# Option A: set MYSQL_ATTR_SSL_CA to a path (e.g. Render secret file mount).
# Option B: set MYSQL_SSL_CA_B64 to the base64-encoded contents of Aiven's ca.pem (single line — easy in Render UI).
if [ -n "${MYSQL_SSL_CA_B64:-}" ]; then
  echo "$MYSQL_SSL_CA_B64" | base64 -d > /tmp/mysql-ssl-ca.pem
  chmod 600 /tmp/mysql-ssl-ca.pem
  export MYSQL_ATTR_SSL_CA=/tmp/mysql-ssl-ca.pem
fi

# SQLite: gitignored file is not in the image — create empty file before migrate.
if [ "$DB_CONNECTION" = "sqlite" ]; then
  if [ ! -f database/database.sqlite ]; then
    touch database/database.sqlite
    chmod 664 database/database.sqlite
  fi
fi

# MySQL/MariaDB: wait until DB answers (Aiven needs correct host, port, password, and often SSL CA above).
if [ "$DB_CONNECTION" = "mysql" ] || [ "$DB_CONNECTION" = "mariadb" ]; then
  attempt=0
  ok=0
  while [ "$attempt" -lt 45 ]; do
    if php artisan db:show >/dev/null 2>&1; then
      ok=1
      break
    fi
    attempt=$((attempt + 1))
    echo "Waiting for database connection (${attempt}/45)..."
    sleep 2
  done
  if [ "$ok" -ne 1 ]; then
    echo ""
    echo "=== Database connection failed after ${attempt} attempts ==="
    echo "Check Render Environment: DB_HOST, DB_PORT, DB_DATABASE, DB_USERNAME, DB_PASSWORD, DB_CONNECTION=mysql"
    echo "For Aiven: download CA cert, base64 it, set MYSQL_SSL_CA_B64 (or MYSQL_ATTR_SSL_CA path)."
    echo "Error output:"
    php artisan db:show 2>&1 || true
    exit 1
  fi
fi

php artisan migrate --force

php artisan config:cache || true
php artisan route:cache || true
php artisan view:cache || true

exec php artisan serve --host=0.0.0.0 --port="$PORT"
