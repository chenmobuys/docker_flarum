ARG NGINX_VERSION
FROM nginx:$NGINX_VERSION

RUN sed -i '0,/nginx/{s/nginx/www-data/}' /etc/nginx/nginx.conf

RUN chown -R www-data.www-data /var/cache/nginx \
    && touch /var/run/nginx.pid \
    && chown -R www-data.www-data /var/run/nginx.pid

USER www-data:www-data