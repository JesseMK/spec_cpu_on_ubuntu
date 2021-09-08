FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

ENV SPECIMG=/data/cpu2006-1.1.iso
ENV SRCDIR=/data/spec_src
ENV BINDIR=/data/spec_bin

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y -q \
    git \
    autoconf \
    automake \
    gcc \
    g++ \
    gcc-multilib \
    g++-multilib \
    build-essential \
    libtool 

RUN bash ./script/extract_spec.sh
RUN bash ./script/patch-for-ubuntu18.04.sh
RUN bash ./script/build.sh
RUN bash ./script/collect_spec_binary.sh

ENTRYPOINT ["bash"]
