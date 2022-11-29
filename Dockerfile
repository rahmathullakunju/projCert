FROM devopsedu/webapp
COPY ./website/ /var/www/html
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN echo "<IfModule mod_dir.c>" > /etc/apache2/mods-enabled/dir.conf
RUN echo "	DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm" >> /etc/apache2/mods-enabled/dir.conf
RUN echo "</IfModule>" >> /etc/apache2/mods-enabled/dir.conf
RUN echo "" >> /etc/apache2/mods-enabled/dir.conf
RUN echo "# vim: syntax=apache ts=4 sw=4 sts=4 sr noet" >> /etc/apache2/mods-enabled/dir.conf
expose 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

