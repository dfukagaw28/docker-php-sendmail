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

```
# cd /path/to/this/directory
# docker build -t test-smtp .
# docker run --rm -it test-smtp /bin/bash
(container)#
```

### Test (to the internal address)

On the container:

```
(container)# php -r 'mail("user@example.com", "test (internal)", "Hello!");'
```

### Test (to the public address)

```
(container)# php -r 'mail("user@gmail.com", "test (outbound)", "Hello!");'
```
