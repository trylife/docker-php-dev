# docker-php-dev

php simple develop environment.


```bash
# docker run --rm trylife/phpdev:7.1-fpm php -v

PHP 7.1.33 (cli) (built: Nov 22 2019 18:34:33) ( NTS )
Copyright (c) 1997-2018 The PHP Group
Zend Engine v3.1.0, Copyright (c) 1998-2018 Zend Technologies
    with Xdebug v2.9.8, Copyright (c) 2002-2020, by Derick Rethans
```

## 参考 `docker-compose.yml`

```yaml
version: '2.1'

services:
  php71:
    image: trylife/phpdev:7.1-fpm
    command:  php -S 0.0.0.0:80 -t www
    environment:
      - docker=true
      - TZ=Asia/Shanghai
    ports:
      - 9090:80
    volumes:
      - ./{your project}:/var/www
      - ./{your project}/logs:/var/www/logs
  adminer:
    environment:
      - TZ=Asia/Shanghai
    ports:
      - 9092:8080
    image: adminer
    restart: always
  redis:
    image: docker.io/redis:6-alpine
    restart: always
    environment:
      - TZ=Asia/Shanghai
    ports:
      - 9093:6379
    logging:
      driver: "json-file"
      options:
        max-size: "50m"
  phpRedisAdmin:
    image: erikdubbelboer/phpredisadmin:latest
    restart: always
    environment:
      - TZ=Asia/Shanghai
      - REDIS_1_HOST=redis
    ports:
      - 9094:80
    logging:
      driver: "json-file"
      options:
        max-size: "50m"
```

## 快捷脚本

可以复制`dk.sh`到项目, `phpunit`需要依赖`vendor`需要修改下grep关键词

```
# ./dk.sh composer
# ./dk.sh phpunit
```

```bash
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
```