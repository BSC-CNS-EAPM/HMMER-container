FROM ubuntu:latest
LABEL   maintainer="Albert Cañellas <albert.canellas@bsc.es>" \
    container="hmmer" \
    about.summary="profile hidden Markov models for protein sequence analysis" \
    about.home="http://hmmer.org/" \
    software.version="3.3.2"


# Update to latest packages
RUN apt-get update --fix-missing && \
    apt-get install -y build-essential wget make && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Installing hmmer 3.3.2
WORKDIR /home/hmmer
RUN wget http://eddylab.org/software/hmmer/hmmer.tar.gz && \
    tar zxf hmmer.tar.gz && \
    cd hmmer-3.* && \
    ./configure && \
    make && \
    make install && \
    cd .. && \
    rm hmmer.tar.gz

WORKDIR /home/projects