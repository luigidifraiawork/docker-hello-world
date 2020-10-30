FROM alpine

MAINTAINER "Luigi Di Fraia"

RUN apk --update add nginx php-fpm && \
    mkdir -p /run/nginx && \
    echo "clear_env = no" >> /etc/php7/php-fpm.conf

ADD www /www

ADD nginx.conf /etc/nginx/

EXPOSE 80

CMD php-fpm7 -d variables_order="EGPCS" && exec nginx -g "daemon off;"
