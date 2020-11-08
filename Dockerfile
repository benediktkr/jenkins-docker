FROM jenkins/jenkins:lts
MAINTAINER Benedikt Kristinsson <benedikt@lokun.is>

USER 0
RUN usermod -u 1207 jenkins

COPY docker.gpg /root/docker.gpg
RUN cat /root/docker.gpg | apt-key add -

RUN apt-get update && \
    apt-get install -y ca-certificates software-properties-common && \
    apt-add-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce-cli

USER jenkins
