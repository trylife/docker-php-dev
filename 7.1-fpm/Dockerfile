FROM php:7.1-fpm

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        git \
        zip \
        unzip

ADD ./7.1-fpm/php.ini /usr/local/etc/php/conf.d/

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd
RUN docker-php-ext-install zip mysqli pdo pdo_mysql

RUN pecl channel-update pecl.php.net
RUN pecl install xdebug
ADD ./7.1-fpm/docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/

ADD ./7.1-fpm/install-composer.sh /var/install/
RUN ["chmod", "+x", "/var/install/install-composer.sh"]
RUN /var/install/install-composer.sh
RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com

RUN curl https://phar.phpunit.de/phpunit-7.5.20.phar -o /usr/bin/phpunit && chmod +x /usr/bin/phpunit

WORKDIR /var/www/