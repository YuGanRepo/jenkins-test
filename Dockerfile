FROM hub.yucloud.org/base/openjdk:8-jdk-alpine
MAINTAINER GANYU ganyu@glanway.com

COPY target/jenkins-test-0.0.1-SNAPSHOT.jar /app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]