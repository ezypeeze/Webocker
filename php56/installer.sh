# Update Package List
apt-get update

# Basic packages
apt-get install -y sudo software-properties-common nano curl \
    build-essential dos2unix gcc git git-flow libmcrypt4 libpcre3-dev apt-utils \
    make python2.7-dev python-pip re2c supervisor unattended-upgrades whois vim zip unzip

# PPA Repositories
apt-add-repository ppa:phalcon/stable  -y
apt-get update -y

# PHP Frameworks
cd /
git clone --depth=1 git://github.com/phalcon/cphalcon.git
cd cphalcon/build
./install

echo "extension=phalcon.so" >> /usr/local/etc/php/conf.d/30phalcon.ini
