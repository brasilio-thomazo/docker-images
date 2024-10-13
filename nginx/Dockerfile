FROM devoptimus/alpine
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN apk add --no-cache nginx \
    && sed -i -e "s/^error_log .*/error_log stderr notice;/" /etc/nginx/nginx.conf \
    && mkdir -p /etc/nginx/templates /var/www/app/public \
    && chown -R nginx:nginx /etc/nginx/templates
USER app
EXPOSE 80
ENTRYPOINT [ "entrypoint.sh" ]