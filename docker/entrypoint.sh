#!/bin/sh
set -e

cd /var/www/html

# Render and other hosts inject PORT; default for local docker run
PORT="${PORT:-8080}"

php artisan config:cache || true
php artisan route:cache || true
php artisan view:cache || true

exec php artisan serve --host=0.0.0.0 --port="$PORT"
