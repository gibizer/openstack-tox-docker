FROM ubuntu:focal

ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y
RUN apt install -y vim git tox python3 python3-pip python3-dev libxml2-dev libxslt1-dev libffi-dev libssl-dev libpq-dev build-essential libsasl2-dev libldap2-dev

RUN pip3 install --upgrade 'pip==21.0.1'
RUN pip3 install --upgrade 'virtualenv==20.4.3'
RUN pip3 install --upgrade 'tox==3.23.0'
RUN pip3 install --upgrade bindep

