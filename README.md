# PHP-FPM

[![GitHub stars](https://img.shields.io/github/stars/khs1994-docker/php-fpm.svg?style=social&label=Stars)](https://github.com/khs1994-docker/php-fpm) [![GitHub tag](https://img.shields.io/github/tag/khs1994-docker/php-fpm.svg)](https://github.com/khs1994-docker/php-fpm) [![Docker Stars](https://img.shields.io/docker/stars/khs1994/php-fpm.svg)](https://store.docker.com/community/images/khs1994/php-fpm) [![Docker Pulls](https://img.shields.io/docker/pulls/khs1994/php-fpm.svg)](https://store.docker.com/community/images/khs1994/php-fpm)

# Supported tags and respective `Dockerfile` links

* [`7.1.11-alpine`,`latest-alpine`(7.1/alpine/Dockerfile)](https://github.com/khs1994-docker/php-fpm/blob/7.1.11/7.1/alpine/Dockerfile)
* [`7.1.11`,`latest`(7.1/Dockerfile)](https://github.com/khs1994-docker/php-fpm/blob/7.1.11/7.1/Dockerfile)
* [`7.1.10-alpine`,`latest-alpine`(7.1/alpine/Dockerfile)](https://github.com/khs1994-docker/php-fpm/blob/7.1.10/7.1/alpine/Dockerfile)
* [`7.1.10`,`latest`(7.1/Dockerfile)](https://github.com/khs1994-docker/php-fpm/blob/7.1.10/7.1/Dockerfile)

# Overview

基于官方 [PHP-FPM](https://github.com/docker-library/docs/tree/master/php) 修改的 Docker 镜像，添加了一些常用 [PHP 扩展](https://github.com/khs1994-docker/lnmp/blob/master/docs/php.md)、Composer 和 Laravel 安装程序。

# Pull

based Alpine

```bash
$ docker pull khs1994/php-fpm:7.1.10-alpine
```

Or based Debian

```bash
$ docker pull khs1994/php-fpm:7.1.10
```

# Who use it?

[khs1994-docker/lnmp](https://github.com/khs1994-docker/lnmp) use this Docker Image.

# More Information

* [khs1994-docker/lnmp](https://github.com/khs1994-docker/lnmp)

* [Official PHP Dockerfiles](https://github.com/docker-library/php)

* [Official PHP Dockerfiles README](https://github.com/docker-library/docs/tree/master/php)
