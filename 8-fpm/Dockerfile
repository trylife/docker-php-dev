FROM php:8.0.8-fpm

RUN apt-get update -y
RUN apt-get upgrade -y

RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install bcmath

WORKDIR /var/www/