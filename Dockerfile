FROM devopsedu/webapp
RUN  /etc/init.d/apache2 start
COPY ./website/* /var/www/html
expose 80
cmd [php /var/www/html/index.php]
