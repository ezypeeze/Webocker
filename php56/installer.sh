# Update Package List
apt-get update
apt-get upgrade -y

# Force Locale
echo "LC_ALL=en_US.UTF-8" >> /etc/default/locale
locale-gen en_US.UTF-8
export LANG=en_US.UTF-8

# May the clear be with you
echo 'printf "\033c"' >> /usr/bin

# Basic packages
apt-get install -y sudo software-properties-common nano curl \
    build-essential dos2unix gcc git git-flow libmcrypt4 libpcre3-dev apt-utils \
    make python2.7-dev python-pip re2c supervisor unattended-upgrades whois vim zip unzip

# PPA Repositories
apt-add-repository ppa:ondrej/php5-5.6 -y
apt-add-repository ppa:phalcon/stable  -y
apt-get update  -y

# Install PHP
apt-get install -y php5-cli php5-dev \
    php5-mysql php5-pgsql \
    php5-apcu php5-json php5-curl php5-gd \
    php5-gmp php5-imap php5-mcrypt php5-xdebug \
    php5-memcached php5-redis php5-fpm

# Install Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# XDebug Augmentations
echo "xdebug.var_display_max_depth = -1" >> /etc/php5/mods-available/xdebug.ini
echo "xdebug.var_display_max_children = -1" >> /etc/php5/mods-available/xdebug.ini
echo "xdebug.var_display_max_data = -1" >> /etc/php5/mods-available/xdebug.ini
echo "xdebug.max_nesting_level = 500" >> /etc/php5/mods-available/xdebug.ini

# PHP Frameworks
git clone --depth=1 git://github.com/phalcon/cphalcon.git
cd cphalcon/build
./install
echo "extension=phalcon.so" >> /etc/php5/mods-available/phalcon.ini
ln -s /etc/php5/mods-available/phalcon.ini /etc/php5/fpm/conf.d/30-phalcon.ini
ln -s /etc/php5/mods-available/phalcon.ini /etc/php5/cli/conf.d/30-phalcon.ini

# Install Nginx
apt-get -y install nginx
mkdir /var/www
chown -R www-data:www-data /var/www
chmod 755 /var/www
