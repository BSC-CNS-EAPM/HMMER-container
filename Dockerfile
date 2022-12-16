FROM ubuntu:latest
LABEL maintainer="Albert Cañellas <albert.canellas@bsc.es>"

# Update to latest packages
RUN apt-get update --fix-missing && \
    apt-get install -y build-essential wget make && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /home/hmmer
RUN wget http://eddylab.org/software/hmmer/hmmer.tar.gz && \
    tar zxf hmmer.tar.gz && \
    cd hmmer-3.3.2 && \
    ./configure && \
    make && \
    make install && \
    rm hmmer.tar.gz

ENV PATH=/usr/local/hmmer/bin:$PATH