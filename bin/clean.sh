#!/bin/sh
docker container stop njshello_njshello_1 || docker container kill njshello_njshello_1
docker rm -f njshello_njshello_1
docker rmi -f editorbank/njshello
docker image prune -f
docker images -a

