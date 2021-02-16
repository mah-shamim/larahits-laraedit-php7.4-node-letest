FROM laraedit/laraedit 

# Install PHP 8.0
RUN apt-get update
RUN apt-get install --force-yes -y php8.0 php8.0-common php8.0-cli php8.0-fpm php-pear php8.0-curl php8.0-dev php8.0-gd php8.0-mbstring php8.0-zip php8.0-mysql php8.0-xml

# update PHP 8.0 for start up
RUN sed -i "s/7\.0/8\.0/g" /etc/supervisor/conf.d/supervisord.conf

# update PHP 8.0 for homestead
RUN sed -i "s/7\.0/8\.0/g" /etc/nginx/sites-available/homestead

# Install Node
npm install -g n
n latest

# Change /etc/nginx/sites-available/homestead to accept all domain
RUN sed -i "s/default_server//g;" /etc/nginx/sites-available/homestead
RUN sed -i "s/localhost/_/g;" /etc/nginx/sites-available/homestead