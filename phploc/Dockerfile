# syntax=docker/dockerfile-upstream:master

ARG PHP_VERSION=7.4.33
ARG USERNAME=khs1994
ARG BASE=composer

FROM alpine:3.19 as phploc-downloader

# Copy/Paste Detector (CPD) for PHP code.  https://github.com/sebastianbergmann/phploc

ARG PHPLOC_VERSION=7.0.2

RUN set -x ; apk add --no-cache curl \
    && curl -fsSL https://phar.phpunit.de/phploc-${PHPLOC_VERSION}.phar -o /usr/local/bin/phploc \
    && chmod +x /usr/local/bin/phploc

FROM --platform=$TARGETPLATFORM ${USERNAME}/php:${PHP_VERSION}-${BASE}-alpine

COPY --from=phploc-downloader /usr/local/bin/phploc /usr/local/bin/phploc

ENTRYPOINT ["phploc"]
