FROM taller/dpl-8

### CHANGE HERE YOUR USER ID TO DEVELOPMENT
ENV PERM_USER_ID 1000

### CREATE USER FOR DEVELOPMENT
RUN echo "%sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    useradd -u ${PERM_USER_ID} -G users,www-data,sudo -d /taller --shell /bin/bash -m taller && \
    echo "secret\nsecret" | passwd taller

### IMPORT FILES TO ENVIRONMENT
COPY ./.bashrc       /taller/.bashrc
COPY ./nginx.conf    /etc/nginx/nginx.conf
COPY ./fastcgi.conf  /etc/nginx/fastcgi.conf
COPY ./fpm.conf      /etc/php5/fpm/php-fpm.conf
COPY ./www.conf      /etc/php5/fpm/pool.d/www.conf
COPY ./fpm.ini       /etc/php5/fpm/php.ini
COPY ./cli.ini       /etc/php5/cli/php.ini
COPY ./xdebug.ini    /etc/php5/mods-available/xdebug.ini
COPY ./cron /taller/cron

RUN chown taller:taller /taller/.bashrc
RUN composer self-update

### SET DEFAULT USER TO DEVELOPMENT
USER taller
WORKDIR /taller

RUN composer global require "hirak/prestissimo:^0.3"
COPY ./entrypoint.sh /etc/entrypoint.sh
RUN sudo chmod +x /etc/entrypoint.sh

CMD ["/bin/bash"]
ENTRYPOINT ["/etc/entrypoint.sh"]
