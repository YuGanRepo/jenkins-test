#!/bin/bash

MODULE=$1
TIME=`date  "+%Y%m%d%H%M"`
GIT_REVISION=`git log -1 --pretty=format:"%h"`
IMAGE_PRFIX=hub.yucloud.org/micro-service/${MODULE}
IMAGE_NAME=${IMAGE_PRFIX}:${TIME}_${GIT_REVISION}

# cd ${MODULE}

docker build -t ${IMAGE_NAME} .

#docker rm -f $(docker ps -a |  grep "${IMAGE_PRFIX}*"  | awk '{print $1}')

docker ps | grep jenkins-test &> /dev/null
if [ $? -ne 0 ]
then
 echo "no runtime image"
else
 docker rm -f ${MODULE}
 echo "remove old image successfull"
fi

# docker run -d --name jk-test -p 8090:8080 hub.yucloud.org/micro-service/jenkins-test:201905071940_b6e75f
docker run -d --name ${MODULE} -p 8090:8080 ${IMAGE_NAME}

# docker rmi $(docker images | grep "jenkins-test" | grep -v "201905072324_9f44279" | awk '{print $3}')
