FROM openjdk:11.0.5-jre-slim

LABEL maintainer="ghuangxunyi@gmail.com"

ARG KAFKA_VERSION=2.4.0
ARG MIRROR=

RUN apt update && \
    apt install -y wget && \
    