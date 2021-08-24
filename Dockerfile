FROM devopsedu/webapp
COPY ./website/ /var/www/html
expose 80
CMD  /etc/init.d/apache2 start
#cmd [php /var/www/html/index.php]
