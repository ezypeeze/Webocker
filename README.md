# Webocker
Docker Web Environment

### Image "php56" ###
#### What is Installed ####
- PHP v5.6.21
- MySQL/PostgreSQL Adapters
- Redis/Memcached Adapters
- Phalcon PHP Framework
- Composer
- Nginx

### Image "postgres" ###
- extended from https://hub.docker.com/_/postgres/

### Image "mysql" ###
- extended from https://hub.docker.com/_/mysql/

### Image "redis" ###
- extended from https://hub.docker.com/_/redis/

### Image "memcached" ###
- extended from https://hub.docker.com/_/memcached/

## Helpfull Notes
Use "docker-compose up -d php56" to start the container (all cache/db images will be also up)

To add a new website configuration in nginx simply go to: webocker/volumes/nginx/sites-enabled

To add your website code: webocker/volumes/www

To check nginx/php logs: webocker/volumes/logs
