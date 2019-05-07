#!/usr/bin/env bash

mvn clean package

docker build -t hub.yucloud.org/micro-service/jenkins-test:latest .
docker push hub.yucloud.org/micro-service/jenkins-test:latest