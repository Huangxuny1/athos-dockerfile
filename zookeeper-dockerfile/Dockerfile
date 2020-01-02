FROM openjdk:11.0.5-jre-slim

LABEL maintainer="ghuangxunyi@gmail.com"

ARG ZK_VERSION=3.5.6 
ARG MIRROR=https://mirrors.tuna.tsinghua.edu.cn/apache

ENV ZK_DIR=/opt/zookeeper \
    ZK_CONF_DIR=/opt/zookeeper/conf \
    ZK_DATA_DIR=/opt/zookeeper/data \
    ZK_DATA_LOG_DIR=/opt/zookeeper/datalog \
    ZK_LOG_DIR=/opt/zookeeper/logs \
    ZK_MY_ID=-1

ADD ${MIRROR}/zookeeper/zookeeper-${ZK_VERSION}/apache-zookeeper-${ZK_VERSION}-bin.tar.gz .

RUN set -eux && \
    mkdir -p "$ZK_DATA_LOG_DIR" "$ZK_DATA_DIR" "$ZK_CONF_DIR" "$ZK_LOG_DIR" && \
    tar -zxf apache-zookeeper-${ZK_VERSION}-bin.tar.gz -C ${ZK_DIR} --strip-components 1  && \
    cp ${ZK_DIR}/conf/zoo_sample.cfg ${ZK_DIR}/conf/zoo.cfg && \
    rm apache-zookeeper-${ZK_VERSION}-bin.tar.gz
    
EXPOSE 2181 2888 3888 8080

ENV PATH=$PATH:$ZK_DIR/bin \
    ZKCFGDIR=$ZK_CONF_DIR

WORKDIR ${ZK_DIR}

COPY docker-entrypoint.sh /

#CMD /opt/zookeeper/bin/zkServer.sh start-foreground
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["zkServer.sh", "start-foreground"]