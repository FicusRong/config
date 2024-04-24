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

CMD ["/bin/bash"]
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
--rm: Automatically remove the container when it exits
```

# nvidia
```
image="it-artifactory.yitu-inc.com/docker/pytorch/pytorch:1.12.1-cuda11.3-cudnn8-devel"
# -d: detach mode
# -rm: automatically removed after stop
nvidia-docker run --net=host -it --shm-size=32G --name ${name} -v /mnt:/mnt ${image} bash
```
