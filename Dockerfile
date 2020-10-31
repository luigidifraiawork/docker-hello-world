FROM alpine

MAINTAINER "Luigi Di Fraia"

RUN apk --update add nginx php-fpm su-exec && \
    echo "clear_env = no" >> /etc/php7/php-fpm.conf

ADD www /www

ADD nginx.conf /etc/nginx/

EXPOSE 8080

RUN mkdir -p /run/nginx /var/lib/nginx/tmp /var/lib/nginx/logs \
    && chown -R nobody:nobody /run/nginx /var/lib/nginx \
    && chmod -R 0755 /run/nginx /var/lib/nginx

RUN addgroup nobody tty

CMD php-fpm7 -d variables_order="EGPCS" && exec su-exec nobody nginx -g "daemon off;"
