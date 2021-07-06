FROM ubuntu:20.04

ARG ENVIRON=local
ARG DEBIAN_FRONTEND=noninteractive



RUN apt-get update && apt upgrade -y

# install dependencies.
RUN apt install \
    nginx \
    composer \
    php-xml php-mbstring php-imagick php-curl php-pgsql php-gd  \
    php-fpm \
    php-dev \
    --yes

# install mcrypt library    
RUN apt-get install -y libmcrypt-dev \
    && pecl install mcrypt \
    && echo "extension=mcrypt.so" >> "/etc/php/7.4/fpm/php.ini"


COPY notejam/ /app
RUN chown www-data /app -R

COPY docker/.env.php /app/
# COPY docker/supervisord-$ENVIRON.conf /supervisord.conf

# install CloudWatch Agent and enable logging
# ENV RUN_IN_CONTAINER="True"
# RUN wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
# RUN dpkg -i -E amazon-cloudwatch-agent.deb
# COPY build/$ENVIRON-cloudwatch.json /opt/aws/amazon-cloudwatch-agent/bin/default_linux_config.json
# COPY build/$ENVIRON-cloudwatch.json /etc/cwagentconfig

RUN rm /etc/nginx/sites-enabled/default
RUN rm /etc/nginx/sites-available/default
COPY docker/nginx /etc/nginx/sites-enabled/default
RUN chown www-data /etc/nginx/sites-enabled/default


# add migration script to run on instance
COPY docker/migrate.sh /migrate.sh
RUN chmod +x /migrate.sh

# supervisord is needed to run multiple processes inside the container.i.e cloudwatch agent  
# # RUN mkdir -p /var/log/supervisor
# COPY docker/supervisord-$ENVIRON.conf /supervisord.conf

CMD ./usr/sbin/php-fpm7.4 && nginx && tail -f /dev/null
#&& /usr/bin/supervisord -c /supervisord.conf
