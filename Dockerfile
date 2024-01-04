FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

# Update Ubuntu Software repository
RUN apt update
RUN apt upgrade -y

RUN apt install -y git git-lfs cmake build-essential libarchive-tools gcc-arm-none-eabi

RUN useradd -ms /bin/bash newuser
RUN chown newuser /opt
USER newuser

RUN cd /opt/ && git clone --recursive https://github.com/AiWaveTechnologies/ambpro2_sdk
RUN cd /opt/ambpro2_sdk/tools/ && cat asdk-10.3.0-linux-newlib-build-3633-x86_64.tar.bz2.0* | bsdtar -xvf- -C /opt/

