FROM centos:centos6

# Install wget and unzip


# Install openssh-server, php-libs and nginx
RUN rpm -Uvh   http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum -y install which openssh-server php-mysql php-gd php-mcrypt php-zip php-xml php-iconv php-curl php-soap php-simplexml php-pdo php-dom php-cli php-fpm php-mbstring nginx

# Install tar and mysql


# Add the default.conf to /etc/nginx/conf.d/


# Switch php-fpm and nginx services on (chkconfig)


# Download Magento from https://github.com/OpenMage/magento-mirror/archive/magento-1.9.zip


# Unzip Magento


# Move Magento folders and files to /var/www


# Grant write access to folders media, var, app/etc in /var/www
RUN cd /var/www/ && chmod -R o+w media var && chmod o+w app/etc

# Add mage-cache.xml to /var/www/app/etc/


# Add seturl.php to /var/www/


# Add start.sh to root folder


# Make start.sh executable


# Add "daemon off;" to /etc/nginx/nginx.conf


# Set entrypoint script to start.sh



