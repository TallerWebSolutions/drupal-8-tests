#!/bin/bash

sudo service php5-fpm restart > /tmp/php.log
sudo service nginx restart > /tmp/nginx.log

while ! nc -q 1 db-host 3306 </dev/null; do sleep 3; done

echo ""
echo "------------------------------"
echo "----- Database connected -----"
echo "------------------------------"
echo ""

# if [ ! -f /taller/dpl-8/src/web/sites/default/settings.local.php ]
# then
#   OLD_PATH=$PWD
#   sudo cp /taller/dpl-8/src/web/sites/example.settings.local.php.sample /taller/dpl-8/src/web/sites/default/settings.local.php
#   sudo chmod -R 777 /taller/dpl-8/src/web/sites/default/settings.local.php
#   sudo mkdir -p /taller/dpl-8/src/web/sites/default/files
#   cd /taller/dpl-8/src && composer install
#   cd /taller/dpl-8/src/web
#   /taller/dpl-8/src/vendor/bin/drush si standard --site-name="Natura FAQ" --account-name="admin" --account-pass="123456" -y
#   cd $OLD_PATH
# fi

# sudo ln -s /taller/dpl-8/src/vendor/bin/drush /usr/local/bin/drush
# sudo ln -s /taller/dpl-8/src/vendor/bin/phpunit /usr/local/bin/phpunit

# sudo chmod -R 777 /taller/dpl-8/src/web/sites/default/files
# sudo chmod 777 /taller/dpl-8/src/web/sites/default/settings.local.php
# sudo chmod +w -R /taller/dpl-8/src/web/sites/default

echo ""
echo "------------------------------"
echo "Virtual Marchine ready to work"
echo "------------------------------"
echo ""

exec "$@"
