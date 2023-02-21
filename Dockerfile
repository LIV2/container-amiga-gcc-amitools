FROM stefanreinauer/amiga-gcc

ENV DEBIAN_FRONTEND=noninteractive

RUN apt -y update && \
    apt -y install git python3 python3-pip && \
    apt -y autoremove && \
    pip3 install git+https://github.com/cnvogelg/amitools.git
