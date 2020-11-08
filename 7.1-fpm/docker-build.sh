#!/usr/bin/env zsh

tag=${PWD##*/}

docker build -t trylife/phpdev:${tag} .