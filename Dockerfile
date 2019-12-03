FROM openjdk:11.0.5-jre

LABEL maintainer="ghuangxunyi@gmail.com"
#VERSION ENV  通过 -e 指定
ENV ZK_VERSION 3.5.6

#RUN apt update && \ 
RUN wget -q https://mirrors.tuna.tsinghua.edu.cn/apache/zookeeper/zookeeper-${ZK_VERSION}/apache-zookeeper-${ZK_VERSION}-bin.tar.gz && \ 
    tar -zxf apache-zookeeper-${ZK_VERSION}-bin.tar.gz -C /opt  && \
    mv /opt/apache-zookeeper-${ZK_VERSION}-bin/conf/zoo_sample.cfg /opt/apache-zookeeper-${ZK_VERSION}-bin/conf/zoo.cfg 

# 映射配置文件目录 和data目录
VOLUME ["/opt/apache-zookeeper-${ZK_VERSION}-bin/conf", "/opt/apache-zookeeper-${ZK_VERSION}-bin/data"]
# 暴露默认端口
EXPOSE 2181 2888 3888

WORKDIR /opt/apache-zookeeper-${ZK_VERSION}-bin/


