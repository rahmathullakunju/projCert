FROM devopsedu/webapp
RUN  /etc/init.d/apache2 start
ADD ./website/* /var/www/html
expose 80
cmd [php /var/www/html/index.php]
