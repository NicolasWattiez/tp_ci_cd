FROM jenkins/jenkins:latest
USER root

RUN apt-get update
RUN apt install python3 python3-pip -y
RUN pip3 install pylint
RUN pip3 install pylint-json2html
