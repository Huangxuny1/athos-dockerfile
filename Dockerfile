FROM openjdk:11.0.5-jre

LABEL maintainer="ghuangxunyi@gmail.com"
#VERSION ENV  通过 -e 指定
ENV ZK_VERSION 3.5.6
#RUN apt update && \ 
RUN wget -q https://mirrors.tuna.tsinghua.edu.cn/apache/zookeeper/zookeeper-${ZK_VERSION}/apache-zookeeper-${ZK_VERSION}-bin.tar.gz && \ 
    mkdir -p /opt/zookeeper/ && \
    tar -zxf apache-zookeeper-${ZK_VERSION}-bin.tar.gz -C /opt/zookeeper/ --strip-components 1  && \
    cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg

# 映射配置文件目录 和data目录
VOLUME ["/opt/zookeeper/conf", "/opt/zookeeper/data"]

# 暴露默认端口
EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper/ 

CMD /opt/zookeeper/bin/zkServer.sh start-foreground
