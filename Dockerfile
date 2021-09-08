FROM ubuntu:20.04
LABEL version="1.0" \
      description="Docker for SPEC 2006 on Focal"

ARG DEBIAN_FRONTEND=noninteractive

ENV SPECIMG=/data/SPEC_CPU2006v1.1.iso
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

ADD ./script /script
ADD ./patch /patch

CMD mkdir -p ${SRCDIR} && \
    mkdir -p ${BINDIR} && \
    /script/extract_spec.sh && \
    bash /script/patch-for-ubuntu18.04.sh && \
    bash /script/build.sh && \
    bash /script/collect_spec_binary.sh && \
    bash
