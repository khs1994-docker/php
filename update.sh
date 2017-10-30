#!/bin/bash

VERSION=7.1

rm -rf ${VERSION} && mkdir ${VERSION}

cp -a ~/lnmp/dockerfile/php-fpm/. ${VERSION}/

cd ${VERSION}

# 国外构建必须换为原始源

sed -i "" "s/COPY/# COPY/g" Dockerfile

mv sources.list sources.cn.list && cp sources.list.default sources.list

mkdir alpine3.4 && cd alpine3.4

cp -a ~/lnmp/dockerfile/php-fpm-alpine/. .

sed -i "" "s/RUN sed/# RUN sed/g" Dockerfile
