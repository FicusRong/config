# basic
`$sudo usermod -aG docker username`
`$docker login it-artifactory.yitu-inc.com`

# Dockerfile
```
ARG CUDA_VERSION=11.7.1
ARG from=it-artifactory.yitu-inc.com/docker-remote/nvidia/cuda:${CUDA_VERSION}-cudnn8-devel-ubuntu20.04

FROM ${from} as base

CMD ["/bin/bash"]
```

# nvidia
`nvidia-docker run --net=host -it -d --rm --shm-size=2G --name ${name} -v /mnt:/mnt ${image} bash`
