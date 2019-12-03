# build
基于 openjdk:11.0.5-jre 构建
```
git clone https://github.com/Huangxuny1/zookeeper-dockerfile.git
cd zookeeper-docker
docker build -t zookeeper:v1
```
# Run

``
docker run -d -p 2181:2181 zookeeper:v1
``
## 可选
- 指定zk版本 -e ZK_VERSION=${VERSION}  默认 ZK_VERSION 3.5.6 
  > 例如 docker run -d -e ZK_VERSION=3.5.5 zookeeper:v1
- 端口映射   -p (2181 2888 3888) 可选
  > 例如 docker run -d -p 2181:2181 -p 2888:2888 -p3888:3888 zookeeper:v1
- 目录挂载   -v (conf/ 和 data/) 
  > 例如 docker run -d -v ${your_dir/conf}:/opt/zookeeper/conf -v ${your_dir/data}:/opt/zookeeper/data
    
