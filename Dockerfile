FROM php:8.0-apache

# 必要な拡張機能のインストール
RUN apt-get update
RUN apt-get install -y libpng-dev git
RUN docker-php-ext-install pdo_mysql


# Composerのインストール
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# アプリケーションのコードをコピー
COPY . /var/www/html

# # ライブラリのインストール
COPY composer.json composer.lock ./
RUN composer install
