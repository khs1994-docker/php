#!/bin/bash

if [ "$1" = git ];then
  git fetch origin master
  exec git reset --hard origin/master
fi

rm -rf 5* 7*

cp -a ~/lnmp/dockerfile/php-fpm/. .
