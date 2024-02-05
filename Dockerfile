FROM python:3.11-slim

RUN sed -i "s@http://deb.debian.org@http://mirrors.aliyun.com@g" /etc/apt/sources.list && rm -Rf /var/lib/apt/lists/* && apt-get update

ENV PIP_NO_CACHE_DIR=true
WORKDIR /tmp
RUN apt-get update && apt-get install build-essential -y

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r requirements.txt

WORKDIR /app
COPY . /app
ENTRYPOINT ["./babyagi.py"]
EXPOSE 8080
