FROM php:apache
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pgsql
RUN echo "extension=pgsql.so" >> /usr/local/etc/php/php.ini
CMD ["apache2-foreground"]