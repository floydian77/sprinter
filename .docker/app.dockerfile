FROM php:7.3-fpm

ARG DOCKER_USER_UID
ARG DOCKER_USER_GID
ARG PHPREDIS_VERSION
ARG XDEBUG_VERSION

RUN apt-get update && apt-get install -y \
    libmcrypt-dev \
    zlib1g-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    gnupg \
    unzip \
    --no-install-recommends

RUN curl -sL https://deb.nodesource.com/setup_13.x | bash - \
    && apt-get install -y nodejs

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) zip iconv gd pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN mkdir /.composer && chown $DOCKER_USER_UID:$DOCKER_USER_GID /.composer \
    && mkdir /.npm && chown $DOCKER_USER_UID:$DOCKER_USER_GID /.npm \
    && mkdir /.config && chown $DOCKER_USER_UID:$DOCKER_USER_GID /.config

#COPY ssl/server.crt /usr/local/share/ca-certificates/
#RUN update-ca-certificates --fresh

COPY conf/php/custom.ini /usr/local/etc/php/conf.d/custom.ini

RUN pecl install xdebug-$XDEBUG_VERSION && docker-php-ext-enable xdebug
RUN echo 'xdebug.remote_port=9000' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.remote_enable=1' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.remote_connect_back=1' >> /usr/local/etc/php/php.ini

COPY conf/app/bashrc /.bashrc
