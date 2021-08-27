FROM ghcr.io/siwatinc/nginx-pagespeed-mariadb:latest
RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update && apt-get -y install openjdk-15-jdk && rm -v /initializer/initialize-builtin.sh
ADD ./initialize-builtin.sh /initializer/initialize-builtin.sh
CMD chmod +x /initializer/initialize-builtin.sh && /initializer/initialize-builtin.sh && service php7.3-fpm start && nginx