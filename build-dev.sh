#!/bin/bash

MODULE=$1
TIME=`date  "+%Y%m%d%H%M"`
GIT_REVISION=`git log -1 --pretty=format:"%h"`
IMAGE_PRFIX=hub.yucloud.org/micro-service/${MODULE}
IMAGE_NAME=${IMAGE_PRFIX}:${TIME}_${GIT_REVISION}

# cd ${MODULE}

docker build -t "${IMAGE_NAME}" .

docker rm -f $(docker ps -a |  grep "${IMAGE_PRFIX}*"  | awk '{print $1}')

docker run -d --name "${IMAGE_PRFIX}" -p 8090:8080 IMAGE_NAME

