FROM alpine

MAINTAINER Tatsuya Kitagawa <tatsuya.kitagawa@t13a.com>

RUN apk add --no-cache \
    bash \
    coreutils \
    curl \
    openssh

COPY /bcmove /usr/local/bin/bcmove

COPY /rootfs /

ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "/usr/sbin/crond", "-f" ]
