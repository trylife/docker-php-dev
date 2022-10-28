#!/usr/bin/env zsh

tag=8-fpm
docker build -t trylife/phpdev:${tag} -f ./${tag}/Dockerfile .