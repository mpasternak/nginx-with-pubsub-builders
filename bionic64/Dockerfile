FROM ubuntu:bionic

RUN apt-get update && apt-get install -y git mc devscripts dput software-properties-common emacs-nox gnupg-agent
RUN unset http_proxy && apt-add-repository -y -s ppa:nginx/stable
RUN apt-get update && apt-get build-dep nginx-full -y

RUN apt-get source nginx-full -y

COPY provisioning/*patch /
COPY provisioning/build-user.sh /

RUN chmod +x /build-user.sh