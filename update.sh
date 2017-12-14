#!/bin/bash

VERSION=7.2

rm -rf ${VERSION} && mkdir -p ${VERSION}/alpine3.7

cp -a ~/lnmp/dockerfile/php-fpm/. ${VERSION}/alpine3.7

# 国外构建必须换为原始源

sed -i "" "s/RUN sed/# RUN sed/g" ${VERSION}/alpine3.7/Dockerfile
