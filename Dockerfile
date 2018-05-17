FROM debian:stretch-slim

RUN apt-get update && \
    apt-get -y install unoconv python3 python3-pip \
    procps less net-tools htop && \
    rm -rf /var/lib/apt/lists/*
RUN /usr/bin/unoconv --listener --server=127.0.0.1 --port=2002

COPY requirements.txt requirements.txt
COPY app.py app.py
RUN pip3 install -r requirements.txt
