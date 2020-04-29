# docker-php-sendmail

Docker PHP image with smtp client

It is expected to work behind a restricted MTA.

## Requirement

* SMTP is running on your docker host.
* On the docker host, you can send an e-mail via localhost.
  * e.g., `sendmail`

## Usage

### Buld & run

On the docker host:
(provided that your SMTP domain is `example.com`)

```
# cd /path/to/this/directory
# docker build -t test-smtp --build-arg SMTP_DOMAIN=example.com .
# docker run --rm -it test-smtp /bin/bash
(container)#
```

### Test (to an internal address)

On the container:

```
(container)# php -r 'mail("user@example.com", "test (internal)", "Hello!");'
```

### Test (to a public address)

```
(container)# php -r 'mail("user@gmail.com", "test (outbound)", "Hello!");'
```

## References

* msmtp
  * https://marlam.de/msmtp/
  * https://wiki.archlinux.org/index.php/Msmtp
  * https://manpages.debian.org/jessie/msmtp/msmtp.1.en.html
* PHP
  * https://www.php.net/manual/en/function.mail.php
