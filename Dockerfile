FROM python:3.11-slim

RUN sed -i "s@http://deb.debian.org@http://mirrors.aliyun.com@g" /etc/apt/sources.list

ENV PIP_NO_CACHE_DIR=true
WORKDIR /tmp
RUN apt-get update && apt-get install build-essential -y

RUN pip install -i https://mirrors.cloud.tencent.com/pypi/simple/ -U pip 
RUN pip config set global.index-url https://mirrors.cloud.tencent.com/pypi/simple

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r requirements.txt

WORKDIR /app
COPY . /app
ENTRYPOINT ["./babyagi.py"]
EXPOSE 8080
