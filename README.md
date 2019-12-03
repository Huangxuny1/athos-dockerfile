# Run
``
docker run -d -p 2181:2181 huangxunyi/zookeeper:latest
``
## 可选
- 端口映射   -p (2181 2888 3888) 可选
  > 例如 docker run -d -p 2181:2181 -p 2888:2888 -p3888:3888 huangxunyi/zookeeper:latest
- 目录挂载   -v (conf/ 和 data/) 
  > 例如 docker run -d -v ${your_dir/conf}:/opt/zookeeper/conf -v ${your_dir/data}:/opt/zookeeper/data huangxunyi/zookeeper:latest

---    

# build
基于 openjdk:11.0.5-jre 构建
```
git clone https://github.com/Huangxuny1/zookeeper-dockerfile.git
cd zookeeper-docker
docker build -t zookeeper:v1
```
### build 选项
- 指定源 --build-arg MIRROR 默认清华源
  > 例如 docker build -t zookeeper:3.5.5 --build-arg https://archive.apache.org/dist/zookeeper . 
- 指定版本 --build-arg ZK_VERSION 默认3.5.6
  > 例如 docker build -t zookeeper:3.5.5 --build-arg ZK_VERSION=3.5.5 .
  
---
