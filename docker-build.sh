#!/usr/bin/env zsh

tag=7.1-fpm
docker build -t trylife/phpdev:${tag} -f ./${tag}/Dockerfile .