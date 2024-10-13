FROM devoptimus/alpine:latest

RUN apk add --no-cache php php-bcmath php-bz2 php-calendar \
    php-ctype php-curl php-dom php-exif php-fileinfo php-fpm \
    php-gd php-gettext php-iconv php-intl php-mbstring php-openssl \
    php-pdo php-pdo_mysql php-pdo_pgsql php-pdo_sqlite php-pear \
    php-phar php-session php-simplexml php-soap php-sockets \
    php-sodium php-sysvmsg php-sysvsem php-sysvshm php-tidy \
    php-tokenizer php-xml php-xmlreader php-xmlwriter php-zip \
    && find /usr/sbin -type f -name "php-fpm*" -exec ln -s {} /usr/sbin/php-fpm \; \
    && find /etc -type d -regex "/etc/php[0-9]*" -exec ln -s {} /etc/php \; \
    && sed -i -e "s/log_level = .*/log_level = notice/" /etc/php/php-fpm.conf \
    && sed -i -e "s/^;error_log = .*/error_log = \/proc\/self\/fd\/2/" /etc/php/php-fpm.conf \
    && sed -i -e "s/^;daemonize = .*/daemonize = no/" /etc/php/php-fpm.conf \
    && sed -i -e "s/^;clear_env = .*/clear_env = no/" /etc/php/php-fpm.d/www.conf \
    && sed -i -e "s/^listen = .*/listen = 9000/" /etc/php/php-fpm.d/www.conf \
    && sed -i -e "s/^user = .*/user = app/" /etc/php/php-fpm.d/www.conf \
    && sed -i -e "s/^group = .*/group = app/" /etc/php/php-fpm.d/www.conf \
    && sed -i -e "s/^;listen.owner = .*/listen.owner = daemon/" /etc/php/php-fpm.d/www.conf \
    && sed -i -e "s/^;listen.group = .*/listen.group = daemon/" /etc/php/php-fpm.d/www.conf \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"
EXPOSE 9000
USER app
CMD [ "doas", "php-fpm", "-F", "-O" ]