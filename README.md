[![GitHub stars](https://img.shields.io/github/stars/khs1994-docker/php-fpm.svg?style=social&label=Stars)](https://github.com/khs1994-docker/php-fpm) [![GitHub tag](https://img.shields.io/github/tag/khs1994-docker/php-fpm.svg)](https://github.com/khs1994-docker/php-fpm) [![Docker Stars](https://img.shields.io/docker/stars/khs1994/php-fpm.svg)](https://store.docker.com/community/images/khs1994/php-fpm) [![Docker Pulls](https://img.shields.io/docker/pulls/khs1994/php-fpm.svg)](https://store.docker.com/community/images/khs1994/php-fpm)

本 Docker 镜像用于 [khs1994-docker/lnmp](https://github.com/khs1994-docker/lnmp) 项目。

基于官方 [PHP-FPM](https://github.com/docker-library/docs/tree/master/php) 修改的 Docker 镜像，添加了一些常用 [PHP 扩展](https://github.com/khs1994-docker/lnmp/blob/master/docs/php.md)、Composer 和 Laravel 安装程序。

# Supported tags and respective `Dockerfile` links

* [`7.1.10-alpine`,`latest-alpine`(7.1/alpine/Dockerfile)](https://github.com/khs1994-docker/php-fpm/blob/7.1.10/7.1/alpine/Dockerfile)
* [`7.1.10`,`latest`(7.1/Dockerfile)](https://github.com/khs1994-docker/php-fpm/blob/7.1.10/7.1/Dockerfile)
* [`7.1.9-alpine`(7.1/alpine/Dockerfile)](https://github.com/khs1994-docker/php-fpm/blob/7.1.9/7.1/alpine/Dockerfile)
* [`7.1.9`(7.1/Dockerfile)](https://github.com/khs1994-docker/php-fpm/blob/7.1.9/7.1/Dockerfile)

# Pull

```bash
$ docker pull khs1994/php-fpm:7.1.10-alpine
```

Or base Debian

```bash
$ docker pull khs1994/php-fpm:7.1.10
```

# Chinese

国内构建由 [阿里云容器服务](https://dev.aliyun.com/detail.html?spm=5176.1972343.2.2.FLSieQ&repoId=75513) 提供。

使用基于 `Debian` 的镜像

```bash
$ docker pull registry.cn-hangzhou.aliyuncs.com/khs1994/php-fpm:7.1.10

$ docker tag registry.cn-hangzhou.aliyuncs.com/khs1994/php-fpm:7.1.10 khs1994/php-fpm:7.1.10
```

或者使用基于 `Alpine` 的镜像

```bash
$ docker pull registry.cn-hangzhou.aliyuncs.com/khs1994/php-fpm:7.1.10-alpine

$ docker tag registry.cn-hangzhou.aliyuncs.com/khs1994/php-fpm:7.1.10-alpine khs1994/php-fpm:7.1.10-alpine
```

# 二次修改（国内机器构建）

clone 或 fork 本项目，在 Dockerfile 中添加 `国内镜像源`（若国外机器构建则不需要此步）

## php-fpm:7.1.10

```docker
COPY ./sources.cn.list /etc/apt/sources.list
```

## php-fpm:7.1.10-alpine

```docker
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
```
