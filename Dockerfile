FROM php:8.1.16-apache

ENV TZ=Asia/Tokyo

RUN apt-get update && \
    # apt-get install -y wget libzip-dev unzip default-mysql-client zip locales libicu-dev && \
    apt-get install -y wget libzip-dev unzip zip locales libicu-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
# RUN docker-php-ext-install intl pdo_mysql
RUN docker-php-ext-install intl

# ENV DOCKERIZE_VERSION v0.6.1
# RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
#     && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
#     && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

# ENV APACHE_DOCUMENT_ROOT /usr/src/myapp/cakephp/webroot
# ENV APACHE_DOCUMENT_ROOT /usr/src/myapp/laravel/public
# ENV APACHE_DOCUMENT_ROOT /usr/src/myapp/slim/public
# ENV APACHE_DOCUMENT_ROOT /usr/src/myapp/symfony/public

# RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf && \
#     sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf && \
#     a2enmod rewrite

WORKDIR /usr/src/myapp

# ENTRYPOINT ["dockerize", "-timeout", "60s", "-wait", "tcp://database:3306"]
# CMD ["apache2-foreground"]
