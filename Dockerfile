# FROM frolvlad/alpine-python3
FROM alpine:edge

RUN apk update && apk add build-base libzmq musl-dev python3 python3-dev zeromq-dev py-pip gcc
RUN pip3 install pyzmq

COPY . /code
WORKDIR /code

RUN pip3 install -r requirements.txt

# reduce image size by cleaning up the build packages
RUN apk del build-base musl-dev python3-dev zeromq-dev

ENTRYPOINT python3 app.py
