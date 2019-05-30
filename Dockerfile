FROM fams/php-apache:5.6

    #&& apt-get -y --no-install-recommends install php5-ldap  php5-memcached php5-mysql php5-adodb php5-gd php5-memcache \
# Install selected extensions and other stuff
RUN apt-get update  \
    && apt-get install -y --no-install-recommends libphp-adodb vim \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

COPY packages/dotproject/ /var/www/app/
COPY php-ini-overrides.ini ${PHP_CONF_DIR}/apache2/conf.d/custom.ini
RUN chown www-data /var/www/app/files /var/www/app/files/temp /var/www/app/locales/en /var/www/app/includes
