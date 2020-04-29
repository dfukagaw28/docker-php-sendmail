FROM php:7.4.5-apache-buster
ARG SMTP_SERVER="mail"
ARG SMTP_DOMAIN="localhost"
RUN set -ex \
  && apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y msmtp \
  && echo 'sendmail_path = "/usr/bin/msmtp -C /etc/msmtprc -t --read-envelope-from"' > /usr/local/etc/php/conf.d/mail.ini \
  && echo "\
account default\n\
host ${SMTP_SERVER}\n\
auto_from on\n\
maildomain ${SMTP_DOMAIN}\n\
syslog LOG_MAIL\n" > /etc/msmtprc
