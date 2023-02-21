#Image: mspass/mspass
#Version: 0.0.1

FROM mspass/mspass

LABEL maintainer="Ian Wang <yinzhi.wang.cug@gmail.com>"
RUN apt-get update \
    && apt-get install -y curl
RUN curl -k -L http://www.mellanox.com/downloads/ofed/RPM-GPG-KEY-Mellanox | apt-key add -
RUN curl -k -L https://linux.mellanox.com/public/repo/mlnx_ofed/latest/ubuntu18.04/mellanox_mlnx_ofed.list > /etc/apt/sources.list.d/mlnx_ofed.list
RUN apt-get update \
    && apt-get install -y wget ssh libibverbs-dev libnuma-dev rsync vim-tiny less \
	libibmad-dev libibumad-dev librdmacm-dev libxml2-dev ca-certificates libfabric-dev \
        mlnx-ofed-basic ucx \
       build-essential python3-setuptools \
       python3-dev python3-pip \
       openjdk-8-jdk \
       git cmake gfortran gdb \
       liblapack-dev libboost-dev libboost-serialization-dev libyaml-dev \
       zip unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* 

