#!/bin/sh
set -e

cd /var/www/html

# Render and other hosts inject PORT; default for local docker run
PORT="${PORT:-8080}"

DB_CONNECTION="${DB_CONNECTION:-sqlite}"

# SQLite: gitignored file is not in the image — create empty file before migrate.
if [ "$DB_CONNECTION" = "sqlite" ]; then
  if [ ! -f database/database.sqlite ]; then
    touch database/database.sqlite
    chmod 664 database/database.sqlite
  fi
fi

# MySQL/MariaDB: other containers (e.g. docker-compose) may start after PHP — wait until DB answers.
if [ "$DB_CONNECTION" = "mysql" ] || [ "$DB_CONNECTION" = "mariadb" ]; then
  attempt=0
  while [ "$attempt" -lt 45 ]; do
    if php artisan db:show >/dev/null 2>&1; then
      break
    fi
    attempt=$((attempt + 1))
    echo "Waiting for database connection (${attempt}/45)..."
    sleep 2
  done
fi

php artisan migrate --force

php artisan config:cache || true
php artisan route:cache || true
php artisan view:cache || true

exec php artisan serve --host=0.0.0.0 --port="$PORT"
