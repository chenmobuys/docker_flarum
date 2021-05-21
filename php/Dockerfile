ARG PHP_VERSION

FROM php:$PHP_VERSION-fpm

COPY config/php.ini /usr/local/etc/php
COPY src/phpredis-5.3.4.tar.gz /usr/src
COPY entrypoint /usr/local/bin/

RUN echo -e "\033[32m\n#########################################\n############ change sources #############\n#########################################\n\033[0m"
RUN sed -i s/deb.debian.org/mirrors.ustc.edu.cn/g /etc/apt/sources.list \
    && sed -i s/security.debian.org/mirrors.ustc.edu.cn/g /etc/apt/sources.list

RUN echo -e "\033[32m\n#########################################\n### install git libpng-dev libzip-dev ###\n#########################################\n\033[0m"
RUN cd /usr/src \
    && apt-get clean \
    && apt-get update \
    && apt-get install -y git libjpeg-dev libpng-dev libgif-dev libwebp-dev libwmf-dev libexif-dev libzip-dev\
    && mkdir -p /usr/src/php/ext \
    && mkdir -p /www \
    && chmod +x /usr/local/bin/entrypoint 

RUN echo -e "\033[32m\n#########################################\n############# install redis #############\n#########################################\n\033[0m"
RUN cd /usr/src && tar -xzvf phpredis-5.3.4.tar.gz \
    && mv phpredis-5.3.4 /usr/src/php/ext/redis \
    && docker-php-ext-install redis

RUN echo -e "\033[32m\n#########################################\n####### install offical extensions ######\n#########################################\n\033[0m"
RUN docker-php-ext-install opcache pdo_mysql mysqli pcntl gd zip exif

RUN echo -e "\033[32m\n#########################################\n########### install composer ############\n#########################################\n\033[0m"
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

USER www-data:www-data

ENTRYPOINT ["/usr/local/bin/entrypoint"]