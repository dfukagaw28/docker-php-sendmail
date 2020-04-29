FROM php:7.4.5-apache-buster
RUN set -ex \
  && apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y msmtp \
  && echo 'sendmail_path = "/usr/bin/msmtp -C /etc/msmtprc -t --read-envelope-from"' > /usr/local/etc/php/conf.d/mail.ini
COPY data/etc/msmtprc /etc/msmtprc
