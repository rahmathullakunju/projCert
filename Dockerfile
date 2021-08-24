FROM devopsedu/webapp
COPY ./website/ /var/www/html
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
expose 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
#CMD  /etc/init.d/apache2 start
#cmd [php /var/www/html/index.php]
