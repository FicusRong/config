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

# nvidia
```
image="it-artifactory.yitu-inc.com/docker/pytorch/pytorch:1.12.1-cuda11.3-cudnn8-devel"
nvidia-docker run --net=host -it -d --rm --shm-size=2G --name ${name} -v /mnt:/mnt ${image} bash
```
