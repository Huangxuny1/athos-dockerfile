# kafka dockerfile

# run singlton

```bash
# 先运行 zookeeper
docker run -d --name zk huangxunyi/zookeeper:3.5.6
# 运行kafka
docker run -d --name kafka --link zk huangxunyi/kafka:latest
```

