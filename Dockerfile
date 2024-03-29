FROM stefanreinauer/amiga-gcc

ENV DEBIAN_FRONTEND=noninteractive

RUN apt -y update && \
    apt -y install git \
    python3 \
    python3-pip \
    wget \
    srecord && \
    apt -y autoremove && \
    pip3 install amitools

RUN mkdir -p /tmp/vbcc-targets && \
    wget http://phoenix.owl.de/vbcc/2022-05-22/vbcc_target_m68k-amigaos.lha -O /tmp/vbcc-targets/vbcc_target_m68k-amigaos.lha && \
    cd /tmp/vbcc-targets && \
    lha -x vbcc_target_m68k-amigaos.lha && \
    cd - && \
    mv /tmp/vbcc-targets/vbcc_target_m68k-amigaos/targets /opt/amiga/m68k-amigaos/vbcc/ &&\
    rm -rf /tmp/vbcc-target && \
    find /opt/amiga -type f -perm 600 -exec chmod o+r {} \;

