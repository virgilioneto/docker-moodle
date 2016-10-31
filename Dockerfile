FROM php:5-apache
MAINTAINER Virgilio Missão Neto

RUN curl -fsSL 'https://download.moodle.org/download.php/direct/stable31/moodle-latest-31.tgz' -o moodle.tgz \
	&& mkdir -p moodle \
	&& tar -xf moodle.tgz -C moodle --strip-components=1 \
	&& mv moodle/* /var/www/html \
	&& rm moodle.tgz \
	&& rm -rf moodle

RUN apt-get update 
RUN apt-get install -y php5-mysql libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng12-dev php5-gd php5-curl php5-intl php5-xmlrpc zlib1g-dev libicu-dev g++ libxml2-dev

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-configure intl

RUN docker-php-ext-install -j$(nproc) iconv mcrypt mysqli gd intl xmlrpc zip

RUN mkdir -p /var/www/moodledata

RUN chomd -R 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

RUN chmod -R 777 /var/www/moodledata
RUN chown -R www-data:www-data /var/www/moodledata

VOLUME /var/www/html
VOLUME /var/www/moodledata

EXPOSE 80
CMD ["apache2-foreground"]
