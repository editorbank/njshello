#!/bin/sh
docker build -t editorbank/njshello . && docker run -it -p 85:80 --name njshello_njshello_1 editorbank/njshello