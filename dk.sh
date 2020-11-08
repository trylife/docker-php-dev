#!/usr/bin/env zsh

if [ $# -lt 1 ]; then
  echo "operation can not be empty!"
  exit
fi

if [ "$1" = "phpunit" ]; then
  project_name=${PWD##*/}
  docker exec `docker ps | grep -i $project_name | grep php71 | awk '{print $1}'` $*
else
  docker run --rm --interactive --tty --volume $PWD:/var/www trylife/phpdev:7.1-fpm $*
fi