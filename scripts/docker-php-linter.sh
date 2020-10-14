#!/bin/bash
docker run -i --rm -v $PWD:$PWD php:cli $* | tee -a /tmp/docker-php.log
