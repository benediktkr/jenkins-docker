FROM jenkins/jenkins:lts
MAINTAINER Benedikt Kristinsson <benedikt@lokun.is>

USER 0

COPY docker.gpg /root/docker.gpg
RUN cat /root/docker.gpg | apt-key add -

RUN apt-get update && \
    apt-get install -y ca-certificates software-properties-common && \
    apt-add-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce-cli

RUN usermod -u 1207 jenkins
RUN groupadd docker -g 998 && usermod -a -G docker jenkins

USER jenkins
