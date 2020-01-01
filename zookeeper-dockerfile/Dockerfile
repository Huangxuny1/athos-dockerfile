FROM openjdk:11.0.5-jre

LABEL maintainer="ghuangxunyi@gmail.com"

ARG ZK_VERSION=3.5.6 
ARG MIRROR=https://mirrors.tuna.tsinghua.edu.cn/apache

ENV ZK_CONF_DIR=/opt/zookeeper/conf \
    ZK_DATA_DIR=/opt/zookeeper/data \
    ZK_DATA_LOG_DIR=/opt/zookeeper/datalog \
    ZK_LOG_DIR=/opt/zookeeper/logs \
    ZK_DIR=/opt/zookeeper \
    ZK_MY_ID=-1

#RUN apt update && \ 
RUN apt-get update && \
    apt-get install -y wget && \
    wget -q ${MIRROR}/zookeeper/zookeeper-${ZK_VERSION}/apache-zookeeper-${ZK_VERSION}-bin.tar.gz && \
    mkdir -p ${ZK_DIR} && \
    tar -zxf apache-zookeeper-${ZK_VERSION}-bin.tar.gz -C ${ZK_DIR} --strip-components 1  && \
    cp ${ZK_DIR}/conf/zoo_sample.cfg ${ZK_DIR}/conf/zoo.cfg && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 2181 2888 3888 8080

ENV PATH=$PATH:/$DISTRO_NAME/bin \
    ZKCFGDIR=$ZK_CONF_DIR

# 暴露默认端口
EXPOSE 2181 2888 3888 8080

WORKDIR ${ZK_DIR}

ENTRYPOINT ["/docker-entrypoint.sh"]
#CMD /opt/zookeeper/bin/zkServer.sh start-foreground
CMD ["zkServer.sh", "start-foreground"]