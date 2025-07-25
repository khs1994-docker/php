# syntax=docker/dockerfile-upstream:master
FROM --platform=$TARGETPLATFORM alpine:3.22

LABEL maintainer="khs1994-docker/lnmp <khs1994@khs1994.com>"

ARG PHP_VCS_REF="master"

LABEL com.github.php.php-src.revision=$PHP_VCS_REF

ENV TZ=Asia/Shanghai \
    APP_ENV=development \
    BOX_REQUIREMENT_CHECKER=0

ARG PHP_VERSION=nightly

ARG ALPINE_URL=dl-cdn.alpinelinux.org

ARG PHP_EXTENSION_EXTRA=

ARG PECL_EXTENSION_EXTRA

ARG APK_EXTRA=

ARG APK_DEV_EXTRA=

ARG PHP_EXTRA_CONFIGURE_ARGS_NEW=

# dependencies required for running "phpize"
# these get automatically installed and removed by "docker-php-ext-*" (unless they're already installed)
ENV PHPIZE_DEPS \
      autoconf \
      dpkg-dev dpkg \
      file \
      g++ \
      gcc \
      make \
      pkgconf \
      re2c

# persistent / runtime deps
RUN set -ex \
      && sed -i "s/dl-cdn.alpinelinux.org/${ALPINE_URL}/g" /etc/apk/repositories \
      && apk add --no-cache \
                 ca-certificates \
                 curl \
                 tar \
                 xz \
# https://github.com/docker-library/php/issues/494
                 openssl \
                 bash \
                 tzdata \
                 less \
# ensure www-data user exists
# RUN set -x \
      && adduser -u 82 -D -S -G www-data www-data
# 82 is the standard uid/gid for "www-data" in Alpine
# http://git.alpinelinux.org/cgit/aports/tree/main/apache2/apache2.pre-install?h=v3.3.2
# http://git.alpinelinux.org/cgit/aports/tree/main/lighttpd/lighttpd.pre-install?h=v3.3.2
# http://git.alpinelinux.org/cgit/aports/tree/main/nginx-initscripts/nginx-initscripts.pre-install?h=v3.3.2

ENV PHP_INI_DIR /usr/local/etc/php
# RUN mkdir -p $PHP_INI_DIR/conf.d

##<autogenerated>##
ENV PHP_EXTRA_CONFIGURE_ARGS \
        --disable-phpdbg \
        # https://github.com/docker-library/php/issues/510
        # --enable-embed=shared \
        # --enable-fpm \
        # --with-fpm-user=www-data \
        # --with-fpm-group=www-data \
        --enable-embed=shared \
        --disable-cgi \
        --with-gettext=shared \
        --enable-gd=shared \
            --with-freetype \
            --disable-gd-jis-conv \
            --with-jpeg \
            --with-webp \
            --with-xpm \
            --with-avif \
        --with-pdo-mysql=shared \
        --with-pdo-pgsql=shared \
        # --with-xsl=shared \
        --enable-bcmath=shared \
        --enable-pcntl=shared \
        --with-external-pcre \
        --enable-shmop=shared \
        # --enable-soap=shared \
        --enable-sockets=shared \
        --enable-sysvmsg=shared \
        --enable-sysvsem=shared \
        --enable-sysvshm=shared \
        --with-zip=shared \
        --enable-calendar=shared \
        --enable-intl=shared \
        --enable-exif=shared \
        --with-bz2=shared \
        # --with-tidy=shared \
        --with-gmp=shared \
        --with-pic \
        --with-enchant=shared \
        --enable-fileinfo=shared \
        --with-ldap=shared \
            --with-ldap-sasl \
        # --with-pspell=shared \ # 8.4 removed # https://github.com/php/php-src/commit/b035cb6c8e31bea351f169b3e9f34fdc562e77e1
        --enable-shmop=shared \
        # --with-snmp=shared \
        --with-mysqli=shared \
        --with-pgsql=shared \
        --with-ffi=shared \
        --with-iconv=/usr \
        --enable-ctype=shared \
        --enable-dom=shared \
        --enable-pdo=shared \
        --with-pdo-sqlite=shared,/usr \
        --enable-posix=shared \
        --enable-session=shared \
        --enable-simplexml=shared \
        --with-sqlite3=shared,/usr \
        --enable-tokenizer=shared \
        --enable-xml=shared \
        --enable-xmlreader=shared \
        --enable-xmlwriter=shared \
        ${PHP_EXTRA_CONFIGURE_ARGS_NEW:-}
##</autogenerated>##

# Apply stack smash protection to functions using local buffers and alloca()
# Make PHP's main executable position-independent (improves ASLR security mechanism, and has no performance impact on x86_64)
# Enable optimization (-O2)
# Enable linker optimization (this sorts the hash buckets to improve cache locality, and is non-default)
# Adds GNU HASH segments to generated executables (this is used if present, and is much faster than sysv hash; in this configuration, sysv hash is also generated)
# https://github.com/docker-library/php/issues/272
ENV PHP_CFLAGS="-fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
ENV PHP_CPPFLAGS="$PHP_CFLAGS"
ENV PHP_LDFLAGS="-Wl,-O1 -pie"

# ENV GPG_KEYS CBAF69F173A0FEA4B537F470D66C9593118BCCB6 F38252826ACD957EF380D39F2F7956BC5DA04B5D

# ENV PHP_VERSION 7.3.0beta2
# ENV PHP_URL="https://downloads.php.net/~cmb/php-7.3.0beta2.tar.xz" PHP_ASC_URL="https://downloads.php.net/~cmb/php-7.3.0beta2.tar.xz.asc"
# ENV PHP_SHA256="32670f40aecce130727d841e3191d30237caff643a239d3c16cd579e762bc4c6" PHP_MD5=""

# COPY --from=php:alpine /usr/local/bin/docker-php-* /usr/local/bin/

# COPY --from=php:alpine /usr/local/bin/docker-php-source /usr/local/bin/
# COPY --from=php:alpine /usr/local/bin/docker-php-entrypoint /usr/local/bin/
# COPY --from=php:alpine /usr/local/bin/docker-php-ext-configure /usr/local/bin/
# COPY --from=php:alpine /usr/local/bin/docker-php-ext-enable /usr/local/bin/
# COPY --from=php:alpine /usr/local/bin/docker-php-ext-install /usr/local/bin/

ARG PHP_GIT=https://github.com/php/php-src.git
# ARG PHP_GIT=https://github.com.cnpmjs.org/php/php-src

RUN --mount=type=bind,from=php:alpine,source=/usr/local/bin,target=/opt/bin,rw \
  set -xe \
  \
  && export PATH=$PATH:/opt/bin \
  ; cp /opt/bin/docker-php-entrypoint /usr/local/bin \
  \
  ; mkdir -p $PHP_INI_DIR/conf.d \
  # && apk add --no-cache --virtual .fetch-deps gnupg \
  && mkdir -p /usr/src \
  && cd /usr/src \
  && apk add --no-cache git openssh-client \
  && if ! [ -z "${PHP_VCS_REF}" -o "${PHP_VCS_REF}" = 'master' ];then \
       export FETCH_DEPTH=100; \
     fi \
  \
  && git clone --depth=${FETCH_DEPTH:-15} ${PHP_GIT} php \
  && git -C php reset --hard ${PHP_VCS_REF} \
  \
  && apk del --no-network git openssh-client \
  # wget -O php.tar.xz "$PHP_URL"; \
  # if [ -n "$PHP_SHA256" ]; then \
  #  echo "$PHP_SHA256 *php.tar.xz" | sha256sum -c -; \
  # fi; \
  # if [ -n "$PHP_MD5" ]; then \
  #  echo "$PHP_MD5 *php.tar.xz" | md5sum -c -; \
  # fi; \
  # \
  # if [ -n "$PHP_ASC_URL" ]; then \
  #  wget -O php.tar.xz.asc "$PHP_ASC_URL"; \
  #  export GNUPGHOME="$(mktemp -d)"; \
  #  for key in $GPG_KEYS; do \
  #    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
  #  done; \
  #  gpg --batch --verify php.tar.xz.asc php.tar.xz; \
  #  command -v gpgconf > /dev/null && gpgconf --kill all; \
  #  rm -rf "$GNUPGHOME"; \
  # fi; \
  # && apk del --no-network  .fetch-deps \
  && apk add --no-cache --virtual .build-deps \
          $PHPIZE_DEPS \
          argon2-dev \
          coreutils \
          curl-dev \
          gnu-libiconv-dev \
          libsodium-dev \
          libxml2-dev \
          linux-headers \
          oniguruma-dev \
          openssl-dev \
          readline-dev \
          sqlite-dev \
          cyrus-sasl-dev \
          postgresql-dev \
          libzip-dev \
          zlib-dev \
          libpng-dev \
          freetype-dev \
          libjpeg-turbo-dev \
          libwebp-dev \
          libxpm-dev \
          libexif-dev \
          # libxslt-dev \
          gmp-dev \
          bzip2-dev \
          enchant2-dev \
          gettext-dev \
          icu-dev \
          krb5-dev \
          aspell-dev \
          openldap-dev \
          pcre2-dev \
          # tidyhtml-dev \
          # net-snmp-dev \
          openldap-dev \
          libavif-dev \
          \
          bison \
          ${APK_DEV_EXTRA:-} \
  \
  && rm -vf /usr/include/iconv.h \
  && export CFLAGS="$PHP_CFLAGS" \
            CPPFLAGS="$PHP_CPPFLAGS" \
            LDFLAGS="$PHP_LDFLAGS" \
            PHP_BUILD_PROVIDER='https://github.com/khs1994-docker/php' \
            PHP_UNAME='Linux - Docker' \
            ARGON2_LIBS="-largon2" \
            ARGON2_CFLAGS="-I/usr/include" \
  # && docker-php-source extract \
  && cd /usr/src/php \
  && make clean || true \
  && gnuArch="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)" \
  && ./buildconf --force \
  && ./configure \
    --build="$gnuArch" \
    --with-config-file-path="$PHP_INI_DIR" \
    --with-config-file-scan-dir="$PHP_INI_DIR/conf.d" \
    \
# make sure invalid --configure-flags are fatal errors instead of just warnings
    --enable-option-checking=fatal \
    \
# https://github.com/docker-library/php/issues/439
    --with-mhash \
    \
# --enable-ftp is included here because ftp_ssl_connect() needs ftp to be compiled statically (see https://github.com/docker-library/php/issues/236)
    --enable-ftp=shared \
# --enable-mbstring is included here because otherwise there's no way to get pecl to use it properly (see https://github.com/docker-library/php/issues/195)
    --enable-mbstring=shared \
# --enable-mysqlnd is included here because it's harder to compile after the fact than extensions are (since it's a plugin for several extensions, not an extension in itself)
    --enable-mysqlnd=shared \
# https://wiki.php.net/rfc/libsodium
    --with-sodium=shared \
    \
    --with-curl=shared \
    --with-openssl=shared \
      --with-system-ciphers \
    --with-readline \
    --with-zlib \
# https://wiki.php.net/rfc/argon2_password_hash (7.2+)
    --with-password-argon2 \
    \
# bundled pcre does not support JIT on s390x
# https://manpages.debian.org/stretch/libpcre3-dev/pcrejit.3.en.html#AVAILABILITY_OF_JIT_SUPPORT
    $(test "$gnuArch" = 's390x-linux-musl' && echo '--without-pcre-jit') \
    \
    $PHP_EXTRA_CONFIGURE_ARGS \
  && make -j "$(nproc)" \
  && find -type f -name '*.a' -delete \
  && make install \
  && { find /usr/local/bin /usr/local/sbin -type f -perm +0111 -exec strip --strip-all '{}' + || true; } \
  && make clean \
  && cp -v php.ini-* "$PHP_INI_DIR/" \
  && cd / \
  # && docker-php-source delete \
  # && rm -rf /usr/src/php \
  && docker-php-ext-enable bcmath \
                           bz2 \
                           calendar \
                           enchant \
                           # exif \
                           fileinfo \
                           # gd \
                           gettext \
                           gmp \
                           intl \
                           ldap \
                           pcntl \
                           openssl \
                           mysqlnd \
                           # mysqli \
                           pdo \
                           pdo_mysql \
                           pdo_pgsql \
                           pgsql \
                           # pspell \ # 8.4 removed # https://github.com/php/php-src/commit/b035cb6c8e31bea351f169b3e9f34fdc562e77e1
                           shmop \
                           # snmp \
                           # soap \
                           sodium \
                           sockets \
                           sysvmsg \
                           sysvsem \
                           sysvshm \
                           # tidy \
                           # xsl \
                           # opcache 已默认安装，需要自行载入
                           opcache \
                           ffi \
                           ctype \
                           dom \
                           pdo_sqlite \
                           posix \
                           session \
                           simplexml \
                           sqlite3 \
                           tokenizer \
                           xml \
                           xmlreader \
                           xmlwriter \
                           ftp \
                           mbstring \
                           curl \
                           zip \
                           ${PHP_EXTENSION_EXTRA:-} \
  && echo "extension=exif" > $PHP_INI_DIR/conf.d/docker-php-ext-z-exif.ini \
  && echo "extension=gd" > $PHP_INI_DIR/conf.d/docker-php-ext-z-gd.ini \
  && echo "extension=mysqli" > $PHP_INI_DIR/conf.d/docker-php-ext-z-mysqli.ini \
  && runDeps="$( \
    scanelf --needed --nobanner --format '%n#p' --recursive /usr/local \
      | tr ',' '\n' \
      | sort -u \
      | awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
  )" \
  && apk add --no-cache $runDeps \
  && strip --strip-all /usr/local/lib/libphp.so \
  \
#  && { find $(php-config --extension-dir) -type f -perm +0111 -exec strip --strip-all '{}' + || true; } \
  && apk del --no-network .build-deps \
  && rm -rf /usr/local/include/php/TSRM/tsrm_win32.h \
           /usr/local/include/php/TSRM/tsrm_config.w32.h \
           /usr/local/include/php/Zend/zend_config.w32.h \
           /usr/local/include/php/ext/mysqlnd/config-win.h \
           /usr/local/include/php/ext/standard/winver.h \
           /usr/local/php/man \
  \
# smoke test
  && php --version \
# sodium was built as a shared module (so that it can be replaced later if so desired), so let's enable it too (https://github.com/docker-library/php/issues/598)
# RUN docker-php-ext-enable sodium
  \
# ENTRYPOINT ["docker-php-entrypoint"]
  \
# RUN set -ex \
  && rm -rf /usr/src/php

ENV PECL_BUILD_DEPS \
      libmemcached-dev \
      # yaml-dev \
      pcre2-dev \
      zlib-dev \
      zstd-dev \
# https://github.com/xdebug/xdebug/pull/835
      linux-headers

ENV PECL_RUN_DEPS \
      libmemcached-libs \
      # yaml \
      zlib \
      zstd-libs

RUN --mount=type=bind,from=php:alpine,source=/usr/local/bin,target=/opt/bin,rw \
    --mount=type=cache,target=/usr/local/lib/php/test \
    --mount=type=cache,target=/usr/local/lib/php/doc \
    --mount=type=bind,from=ghcr.io/php/pie:bin,source=/,target=/opt/bin2,rw \
      set -x \
      && export PATH=$PATH:/opt/bin:/opt/bin2 \
      && curl -fsSL -o /tmp/igbinary.tar.gz https://github.com/igbinary/igbinary/archive/master.tar.gz \
      && tar -zxvf /tmp/igbinary.tar.gz -C /tmp \
      && mkdir -p /usr/src/php/ext \
      && touch /usr/src/php/.docker-extracted \
      && mv /tmp/igbinary-master /usr/src/php/ext/igbinary \
      && docker-php-ext-configure igbinary \
      && docker-php-ext-install igbinary \
      && apk add --no-cache --virtual .pecl_build_deps $PECL_BUILD_DEPS $PHPIZE_DEPS \
      && apk add --no-cache --virtual .pecl_run_deps $PECL_RUN_DEPS \
      && export PIE_CONFIG="--with-php-config=/usr/local/bin/php-config \
                           --with-php-path=/usr/local/bin/php \
                           --with-phpize-path=/usr/local/bin/phpize \
                           --skip-enable-extension \
                           --force" \
      && pie -n install ${PIE_CONFIG} \
                     kjdev/zstd \
      # && pie -n install ${PIE_CONFIG} \
      #                igbinary/igbinary:dev-main \
      && pie -n install ${PIE_CONFIG} \
                     phpredis/phpredis:dev-develop \
                     --enable-redis-igbinary --enable-redis-zstd \
      && pie -n install ${PIE_CONFIG} \
                     php-memcached/php-memcached:dev-master \
                     --enable-memcached-igbinary \
      && pie -n install ${PIE_CONFIG} \
                     xdebug/xdebug:dev-master \
      && docker-php-ext-enable zstd \
      && echo "extension=redis" > $PHP_INI_DIR/conf.d/docker-php-ext-z-redis.ini \
      && echo "extension=memcached" > $PHP_INI_DIR/conf.d/docker-php-ext-z-memcached.ini \
      && strip --strip-all $(php-config --extension-dir)/redis.so \
      && strip --strip-all $(php-config --extension-dir)/memcached.so \
      && strip --strip-all $(php-config --extension-dir)/zstd.so \
      && strip --strip-all $(php-config --extension-dir)/xdebug.so \
      && apk del --no-network .pecl_build_deps \
      && rm -rf /tmp/* \
      && rm -rf /root/.pie \
      && rm -rf /root/.composer \
      && rm -rf /usr/src/php \
      && rm -rf /usr/local/lib/php/.registry/.channel.pecl.php.net/* \
      && php -m \
      && ls -la $(php-config --extension-dir) \
      && php -d error_reporting=22527 -d display_errors=1 -r 'var_dump(iconv("UTF-8", "UTF-8//IGNORE", "This is the Euro symbol '\''€'\''."));' \
# smoke test
      && php --version

ENTRYPOINT ["docker-php-entrypoint"]

CMD ["php", "-a"]

WORKDIR /app

ARG VCS_REF="unknow"

LABEL org.opencontainers.image.revision=$VCS_REF \
      org.opencontainers.image.source="https://github.com/khs1994-docker/php"
