FROM openjdk:11.0.5-jre-slim

LABEL maintainer="ghuangxunyi@gmail.com"

ARG KAFKA_VERSION=2.4.0
ARG SCALA_VERSION=2.13
ARG MIRROR=https://mirrors.tuna.tsinghua.edu.cn/apache/kafka

ENV KAFKA_DIR=/opt/kafka \
    KAFKA_ID=-1 \
    KAFKA_HOST=127.0.0.1 \
    KAFKA_PORT=9092 \
    ZK_HOST=zk \
    LOG_RETENTION_HOURS= \
    LOG_RETENTION_BYTES= \
    NUM_PARTITIONS= \
    AUTO_CREATE_TOPICS= \
    DELETE_TOPIC_ENABLE= 

ADD ${MIRROR}/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz .
RUN set -eux && \
    mkdir -p ${KAFKA_DIR} && \
    tar -zxf kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -C ${KAFKA_DIR} --strip-components 1  && \
    rm kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

EXPOSE ${KAFKA_PORT}
COPY docker-entrypoint.sh /
ENV PATH=$PATH:${KAFKA_DIR}/bin
ENTRYPOINT ["/docker-entrypoint.sh"]
WORKDIR ${KAFKA_DIR}
CMD ["kafka-server-start.sh","config/server.properties"]