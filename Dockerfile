
FROM jenkins/jenkins:lts
MAINTAINER Benedikt Kristinsson <benedikt@lokun.is>

USER 0

COPY docker.gpg /root/docker.gpg
RUN cat /root/docker.gpg | apt-key add -

RUN apt-get update && \
    apt-get install -y ca-certificates software-properties-common && \
    apt-add-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce-cli sudo && \
    apt-get install -y python3 python3-pip python3-dev python3-venv && \
    pip install poetry


ARG SUDOIS_JENKINS_UID=1207
ARG SUDOIS_JENKINS_GID=1207
ARG DOCKER_SOCK_GID=998

RUN usermod -u ${SUDOIS_JENKINS_UID} jenkins && \
      groupmod -g ${SUDOIS_JENKINS_GID} jenkins
RUN groupadd docker -g ${DOCKER_SOCK_GID} && \
      usermod -a -G docker jenkins

USER jenkins
