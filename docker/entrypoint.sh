#!/bin/sh
# Always print to stdout so Render log stream shows runtime errors (not only Docker build).
echo "[entrypoint] starting $(date -u '+%Y-%m-%dT%H:%M:%SZ')"
echo "[entrypoint] PORT=${PORT:-unset} DB_CONNECTION=${DB_CONNECTION:-unset}"

set -e

cd /var/www/html

# Render and other hosts inject PORT; default for local docker run
PORT="${PORT:-8080}"

DB_CONNECTION="${DB_CONNECTION:-sqlite}"

# Aiven requires TLS. PDO needs a *file path* for MYSQL_ATTR_SSL_CA.
# Options (Render): MYSQL_ATTR_SSL_CA=/path | MYSQL_SSL_CA_PEM=pem text | MYSQL_SSL_CA_B64=one-line base64
if [ -n "${MYSQL_ATTR_SSL_CA:-}" ] && [ -r "${MYSQL_ATTR_SSL_CA:-}" ]; then
  :
elif [ -n "${MYSQL_SSL_CA_PEM:-}" ]; then
  printf '%s\n' "$MYSQL_SSL_CA_PEM" > /tmp/mysql-ssl-ca.pem
  chmod 600 /tmp/mysql-ssl-ca.pem
  export MYSQL_ATTR_SSL_CA=/tmp/mysql-ssl-ca.pem
elif [ -n "${MYSQL_SSL_CA_B64:-}" ]; then
  case "$MYSQL_SSL_CA_B64" in *BEGIN*CERTIFICATE*)
    printf '%s\n' "$MYSQL_SSL_CA_B64" > /tmp/mysql-ssl-ca.pem
    chmod 600 /tmp/mysql-ssl-ca.pem
    export MYSQL_ATTR_SSL_CA=/tmp/mysql-ssl-ca.pem
    ;;
  *)
    CLEAN=$(printf '%s' "$MYSQL_SSL_CA_B64" | tr -d ' \n\r\t')
    if printf '%s' "$CLEAN" | base64 -d > /tmp/mysql-ssl-ca.pem 2>/dev/null && [ -s /tmp/mysql-ssl-ca.pem ]; then
      chmod 600 /tmp/mysql-ssl-ca.pem
      export MYSQL_ATTR_SSL_CA=/tmp/mysql-ssl-ca.pem
    else
      echo ""
      echo "ERROR: MYSQL_SSL_CA_B64 must be valid base64 (one line, no spaces) or paste the PEM (-----BEGIN CERTIFICATE-----)."
      echo "Mac:  base64 -i ca.pem | tr -d '\n'"
      echo "Or use Render env MYSQL_SSL_CA_PEM with the full PEM text, or remove MYSQL_SSL_CA_B64 if wrong."
      exit 1
    fi
    ;;
  esac
fi

# PHP PDO rejects invalid CA files with "no valid certs found" — validate before artisan runs.
if [ -n "${MYSQL_ATTR_SSL_CA:-}" ] && [ "${MYSQL_ATTR_SSL_CA:-}" = "/tmp/mysql-ssl-ca.pem" ]; then
  if [ ! -s /tmp/mysql-ssl-ca.pem ] || ! grep -qE "BEGIN (CERTIFICATE|TRUSTED CERTIFICATE)" /tmp/mysql-ssl-ca.pem 2>/dev/null; then
    echo ""
    echo "ERROR: Aiven CA file at /tmp/mysql-ssl-ca.pem is empty or not valid PEM."
    echo "Use one of:"
    echo "  1) MYSQL_SSL_CA_B64=\$(base64 -i ca.pem | tr -d '\\n')   # single line"
    echo "  2) MYSQL_SSL_CA_PEM with full text from Aiven (include BEGIN/END lines)."
    echo "  3) Temporarily unset MYSQL_SSL_CA_* and set MYSQL_ATTR_SSL_VERIFY_SERVER_CERT=false in Render (debug only)."
    exit 1
  fi
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
