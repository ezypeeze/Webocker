#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "Please add the name of your website in first param"
    exit
fi

echo "server {
    listen      80;
    server_name $1.local;
    root        /var/www/$1/public;
    index       index.php index.html index.htm;
    charset     utf-8;

    #access_log /var/log/nginx/host.access.log main;

    location / {
        try_files \$uri \$uri/ /index.php?_url=\$uri&\$args;
    }

    location ~ \.php {
        # try_files   \$uri =404;

        fastcgi_pass unix:/var/run/php5-fpm.sock;
        fastcgi_index /index.php;

        include fastcgi_params;
        fastcgi_split_path_info       ^(.+\.php)(/.+)$;
        fastcgi_param PATH_INFO       \$fastcgi_path_info;
        fastcgi_param PATH_TRANSLATED \$document_root\$fastcgi_path_info;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
    }

    location ~ /\.ht {
        deny all;
    }
}" > volumes/nginx/sites-enabled/$1.local

read -p "Add to /etc/hosts? " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
   sudo sh -c "echo '127.0.0.1\t$1.local' >> /etc/hosts"
   echo "Added $1.local to /etc/hosts!"
fi

docker exec -it web-php56 bash -c "service nginx restart && service php5-fpm restart"
