# syntax=docker/dockerfile-upstream:master

ARG PHP_VERSION=8.1.31
ARG USERNAME=khs1994
ARG BASE=composer

FROM alpine as downloader

# php-cs-fixer https://github.com/FriendsOfPHP/PHP-CS-Fixer

ARG PHP_CS_FIXER_VERSION=3.22.0

RUN set -x ; apk add --no-cache curl \
    && curl -fsSL https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases/download/v${PHP_CS_FIXER_VERSION}/php-cs-fixer.phar \
         -o /usr/local/bin/php-cs-fixer \
    && chmod +x /usr/local/bin/php-cs-fixer

FROM --platform=$TARGETPLATFORM ${USERNAME}/php:${PHP_VERSION}-${BASE}-alpine

ENV PHP_CS_FIXER_IGNORE_ENV=1

COPY --from=downloader /usr/local/bin/php-cs-fixer /usr/local/bin/php-cs-fixer

ENTRYPOINT ["php-cs-fixer"]
