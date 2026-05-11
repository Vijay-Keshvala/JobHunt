# syntax=docker/dockerfile:1

# --- Front-end assets (Vite) -----------------------------------------------
FROM node:20-bookworm AS assets
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

# --- PHP application -------------------------------------------------------
FROM php:8.4-cli-bookworm

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y --no-install-recommends \
    git zip unzip \
    libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
    libonig-dev libxml2-dev libzip-dev libpq-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j"$(nproc)" \
       pdo_mysql pdo_pgsql pgsql mbstring exif pcntl bcmath gd zip opcache \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

COPY . .
COPY --from=assets /app/public/build ./public/build

RUN composer install --no-dev --no-interaction --prefer-dist --optimize-autoloader

RUN chown -R www-data:www-data storage bootstrap/cache \
    && chmod -R 775 storage bootstrap/cache

COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENV APP_ENV=production
ENV LOG_CHANNEL=stderr

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
