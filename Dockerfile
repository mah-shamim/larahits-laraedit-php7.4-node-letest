FROM laraedit/laraedit 

# Install PHP 7.2
RUN apt-get update
RUN apt-get install --force-yes -y php7.2 php7.2-common php7.2-cli php7.2-fpm php-pear php7.2-curl php7.2-dev php7.2-gd php7.2-mbstring php7.2-zip php7.2-mysql php7.2-xml

# update PHP 7.2 for start up
RUN sed -i "s/7\.0/7\.2/g" /etc/supervisor/conf.d/supervisord.conf

# update PHP 7.2 for homestead
RUN sed -i "s/7\.0/7\.2/g" /etc/nginx/sites-available/homestead

# Install Node
npm install -g n
n latest

# Change /etc/nginx/sites-available/homestead to accept all domain
RUN sed -i "s/default_server//g;" /etc/nginx/sites-available/homestead
RUN sed -i "s/localhost/_/g;" /etc/nginx/sites-available/homestead