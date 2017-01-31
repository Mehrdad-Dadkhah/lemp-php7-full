FROM mehrdadkhah/php7:latest

MAINTAINER Mehrdad Dadkhah <mehrdad@dadkhah.me>

ENV fpm_conf /usr/local/etc/php-fpm.d/www.conf

RUN curl http://nginx.org/keys/nginx_signing.key --output nginx_signing.key && \
    apt-key add nginx_signing.key && \
    echo 'deb http://nginx.org/packages/debian/ jessie nginx' >> /etc/apt/sources.list && \
    echo 'deb-src http://nginx.org/packages/debian/ jessie nginx' >> /etc/apt/sources.list && \
    apt-get update -y && \
    apt-get install -y nginx && \
    apt-get install -y supervisor

RUN mkdir -p /etc/nginx/sites-enabled/ && \
	rm -Rf /var/www/* && \
	mkdir /var/www/html/ && \
	rm -Rf /etc/nginx/sites-enabled/*

RUN mkdir -p /var/log/supervisor

COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR /var/www/html

RUN chown -R www-data:www-data .

RUN rm -rf /var/lib/apt/lists/*

EXPOSE 80 443

CMD ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisor/conf.d/supervisord.conf"]