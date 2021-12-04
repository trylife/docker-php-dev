FROM php:7.1-fpm

RUN apt update -y
RUN apt-get update -y
RUN apt-get install -y libfreetype6-dev
RUN apt-get install -y libjpeg62-turbo-dev
RUN apt-get install -y libpng-dev
RUN apt-get install -y git
RUN apt-get install -y zip
RUN apt-get install -y unzip
RUN apt-get install -y iputils-ping
RUN apt-get install -y nginx
RUN apt-get install -y zsh
RUN apt-get install -y zsh-syntax-highlighting
#RUN apt-get install -y zsh-history-substring-search
RUN apt-get install -y zsh-autosuggestions
#RUN apt-get install -y zsh-git-prompt

ADD ./7.1-fpm/nginx-default-site.conf /etc/nginx/sites-enabled/default
ADD ./7.1-fpm/php.ini /usr/local/etc/php/conf.d/

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

RUN docker-php-ext-install zip mysqli pdo pdo_mysql
RUN docker-php-ext-install bcmath

RUN pecl channel-update pecl.php.net
RUN pecl install xdebug-2.9.8
ADD ./7.1-fpm/docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/

# https://github.com/longxinH/xhprof.git
RUN pecl install xhprof
ADD ./7.1-fpm/xhprof.ini /usr/local/etc/php/conf.d/

ADD ./7.1-fpm/install-composer.sh /var/install/
RUN ["chmod", "+x", "/var/install/install-composer.sh"]
RUN /var/install/install-composer.sh
# RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com
# phpunit installed by composer
# RUN curl https://phar.phpunit.de/phpunit-7.5.20.phar -o /usr/bin/phpunit && chmod +x /usr/bin/phpunit

WORKDIR /var/www/