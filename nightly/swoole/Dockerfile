# syntax=docker/dockerfile-upstream:master
ARG USERNAME=khs1994
ARG BASE=cli

FROM --platform=$TARGETPLATFORM ${USERNAME}/php:nightly-${BASE}-alpine

LABEL maintainer="khs1994-docker/lnmp <khs1994@khs1994.com>"

ARG VCS_REF="unknow"

LABEL org.opencontainers.image.revision=$VCS_REF \
      org.opencontainers.image.source="https://github.com/khs1994-docker/php"

ARG ALPINE_URL=dl-cdn.alpinelinux.org

ARG PHP_EXTENSION_EXTRA

ARG PECL_EXTENSION_EXTRA

ARG APK_EXTRA

ARG APK_DEV_EXTRA

ENV PECL_EXTENSION \
      swoole \
      ${PECL_EXTENSION_EXTRA:-}

# ENV SWOOLE_VERSION=v5.0.3
ENV SWOOLE_VERSION=master \
    BOX_REQUIREMENT_CHECKER=0

RUN --mount=type=bind,from=php:alpine,source=/usr/local/bin,target=/opt/bin,rw \
    set -x \
    && sed -i "s/dl-cdn.alpinelinux.org/${ALPINE_URL}/g" /etc/apk/repositories \
    && apk add --no-cache --virtual .pecl_build_deps \
                                    $PHPIZE_DEPS \
                                    openssl-dev \
                                    pcre2-dev \
    && export PATH=$PATH:/opt/bin \
    && curl -fsSL -o /tmp/swoole.tar.gz https://github.com/swoole/swoole-src/archive/${SWOOLE_VERSION}.tar.gz \
    && tar -zxvf /tmp/swoole.tar.gz -C /tmp \
    && mkdir -p /usr/src/php/ext \
    && touch /usr/src/php/.docker-extracted \
    && mv /tmp/swoole-src-master /usr/src/php/ext/swoole \
    && docker-php-ext-configure swoole --enable-openssl \
    && docker-php-ext-install swoole \
    && apk del --no-network .pecl_build_deps \
    && rm -rf /tmp/* \
    && rm -rf /usr/src/php \
    && rm -rf /usr/local/lib/php/.registry/.channel.pecl.php.net/* \
# smoke test
    && php --version

WORKDIR /app

ENTRYPOINT ["php"]

CMD ["index.php"]
