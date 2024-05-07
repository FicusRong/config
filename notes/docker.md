# basic
```
sudo usermod -aG docker username
docker login it-artifactory.yitu-inc.com
```

# Dockerfile
```
ARG CUDA_VERSION=11.3
ARG from=it-artifactory.yitu-inc.com/docker-remote/nvidia/cuda:${CUDA_VERSION}-cudnn8-devel-ubuntu22.04

FROM ${from} as base

# Install base utilities
RUN echo " deb http://mirrors.aliyun.com/ubuntu/ jammy main restricted universe multiverse\n deb-src http://mirrors.aliyun.com/ubuntu/ jammy main restricted universe multiverse\n deb http://mirrors.aliyun.com/ubuntu/ jammy-security main restricted universe multiverse\n deb-src http://mirrors.aliyun.com/ubuntu/ jammy-security main restricted universe multiverse\n deb http://mirrors.aliyun.com/ubuntu/ jammy-updates main restricted universe multiverse\n deb-src http://mirrors.aliyun.com/ubuntu/ jammy-updates main restricted universe multiverse\n deb http://mirrors.aliyun.com/ubuntu/ jammy-proposed main restricted universe multiverse\n deb-src http://mirrors.aliyun.com/ubuntu/ jammy-proposed main restricted universe multiverse\n deb http://mirrors.aliyun.com/ubuntu/ jammy-backports main restricted universe multiverse\n deb-src http://mirrors.aliyun.com/ubuntu/ jammy-backports main restricted universe multiverse" > /etc/apt/sources.list
RUN apt-get update \
    && apt-get install -y build-essential \
    && apt-get install -y wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -u 10042 srong
RUN usermod -aG sudo srong
USER srong

# Install miniconda
ENV CONDA_DIR ~/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p $CONDA_DIR
ENV PATH=$CONDA_DIR/bin:$PATH
RUN conda init bash

# Set pip source
RUN pip config --user set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

CMD ["/bin/bash"]
```
```
docker build -t ${name} . --no-cache
```

# docker run
```
docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
-i: 以交互模式运行容器，通常与 -t 同时使用；
-t: 为容器重新分配一个伪输入终端，通常与 -i 同时使用；
--name ${name}: 为容器指定一个名称；
-v ${local_path}:/${target_path}: 绑定一个卷
--shm-size=32G: 设置容器使用内存最大值；
--net=host: 默认是 bridge 模式
-d: 后台运行容器，并返回容器ID；
--rm: automatically removed after stop
```
## nvidia
```
image="it-artifactory.yitu-inc.com/docker/pytorch/pytorch:1.12.1-cuda11.3-cudnn8-devel"
nvidia-docker run --net=host -it --shm-size=128G --name ${name} -v /mnt:/mnt ${image} bash
docker exec -u srong -it ${name} bash
```
