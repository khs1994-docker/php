# syntax=docker/dockerfile-upstream:master
ARG PHP_VERSION=7.4.33
ARG USERNAME=khs1994

FROM --platform=$TARGETPLATFORM ${USERNAME}/php:${PHP_VERSION}-cli-alpine

LABEL maintainer="khs1994-docker/lnmp <khs1994@khs1994.com>"

ENV NGINX_UNIT_VERSION=1.33.0
# ENV NGINX_UNIT_VERSION=master

RUN set -x \
  && mkdir -p /usr/src/unit \
  && cd /usr/src/unit \
  && curl -fsSL https://github.com/nginx/unit/archive/${NGINX_UNIT_VERSION}.tar.gz \
     | tar --strip=1 -zxvf - \
  && apk add --no-cache --virtual .build-deps \
                                  $PHPIZE_DEPS \
                                  openssl-dev \
                                  linux-headers \
                                  pcre2-dev \
  && ./configure --prefix=/usr/local/nginx-unit --openssl \
  && ./configure php \
       --module=php74 \
       --lib-path=/usr/local/lib \
       --config=/usr/local/bin/php-config \
  && make -j "$(nproc)" \
  && make install \
  && strip --strip-all /usr/local/nginx-unit/sbin/unitd \
  && mkdir -p /usr/local/sbin \
  && ln -sf /usr/local/nginx-unit/sbin/unitd /usr/local/sbin/unitd \
  && ln -sf /usr/local/nginx-unit/sbin/unitd /usr/sbin/unitd \
  && apk add --no-cache findutils \
  && apk del --no-network .build-deps \
  && rm -rf /usr/src/* \
  && mkdir -p /var/log/nginx-unit /usr/local/nginx-unit/tmp \
  && ln -sf /dev/stdout /var/log/nginx-unit/nginx-unit.log \
  && mkdir /docker-entrypoint.d/

COPY docker-entrypoint.sh /

ENV PS1="[\u@\h \w]# "

VOLUME [ "/usr/local/nginx-unit/tmp", "/usr/local/nginx-unit/state" ]

STOPSIGNAL SIGTERM

ENTRYPOINT ["bash", "/docker-entrypoint.sh"]

CMD ["unitd","--no-daemon","--user","root","--group","root","--log","/var/log/nginx-unit/nginx-unit.log","--control","unix:/usr/local/nginx-unit/control.unit.sock"]

WORKDIR /app

ARG VCS_REF="unknow"

LABEL org.opencontainers.image.revision=$VCS_REF \
      org.opencontainers.image.source="https://github.com/khs1994-docker/php"
