FROM registry.cn-hangzhou.aliyuncs.com/hky-new/openjdk:8-jdk-alpine

# 更新apk索引并安装telnet
RUN apk update && apk add --no-cache busybox-extras

ADD target/*.jar /ai-photo-api.jar
ADD target/classes/application.yml /application.yml

EXPOSE 8010

CMD ["java","-jar","ai-photo-api.jar", "-Dspring.config.location=application.yml"]