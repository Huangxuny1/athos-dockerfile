FROM ubuntu:18.04

LABEL maintainer="ghuangxunyi@gmail.com"

ARG RUNNER_VERSION=2.165.2

RUN apt-get update && \
    apt-get install -y curl sudo iputils-ping docker && \
    useradd github && \
    echo ${RUNNER_VERSION} && \
    echo "github ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    usermod -aG sudo github && \
    mkdir /app && \
    cd /app && \
    curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz && \
    tar -xvf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz && \
    sh -x bin/installdependencies.sh && \
    chown -R github:github /app && \ 
    rm /app/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz && \ 
    rm /var/cache/apt/archives/*.deb

COPY  docker-entrypoint.sh /

RUN chown github:github /app/entrypoint.sh && \
    chmod +x /app/entrypoint.sh

USER github
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/app/run.sh"]
