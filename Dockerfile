FROM php:7.2-apache
ARG SMTP_SERVER="mail"
ARG SMTP_DOMAIN="localhost"
ARG SMTP_HOSTNAME="localhost"
RUN set -ex \
  && apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y ssmtp \
  && echo 'sendmail_path = "/usr/sbin/ssmtp -t"' > /usr/local/etc/php/conf.d/mail.ini \
  && echo "\
root=postmaster\n\
mailhub=${SMTP_SERVER}\n\
rewriteDomain=${SMTP_DOMAIN}\n\
hostname=${SMTP_HOSTNAME}\n\
FromLineOverride=YES\n" > /etc/ssmtp/ssmtp.conf
