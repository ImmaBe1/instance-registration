# syntax=docker/dockerfile:1

#FROM python:3.8-slim-buster
FROM ubuntu:latest

RUN apt-get update -y && \
    apt-get install -y cron software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && apt-get update -y && \
    apt install -y python3.8 python3.8-distutils wget && \
    wget https://bootstrap.pypa.io/get-pip.py && python3.8 get-pip.py

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

# setup the heartbeat cron
COPY jobs/heartbeat-cron /etc/cron.d/heartbeat-cron
RUN chmod 0644 /etc/cron.d/heartbeat-cron
RUN crontab /etc/cron.d/heartbeat-cron
RUN touch /var/log/cron.log
 
# Run the command on container startup
CMD [ "bash", "-c", "cron && python3 -m flask run --host=0.0.0.0"]
 
