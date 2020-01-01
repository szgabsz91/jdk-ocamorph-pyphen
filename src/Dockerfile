# JDK 13

FROM openjdk:13-jdk-slim

# Dependencies

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        cvs \
        ocaml-nox \
        ocaml-findlib \
        python \
        curl \
        git \
        ssh \
    && rm -rf /var/lib/apt/lists/*

# Ocamorph

RUN cvs -d :pserver:anonymous:anonymous@cvs.mokk.bme.hu:/local/cvs co ocamorph
RUN make -C ocamorph SUBDIRS="src/lib src/wrappers/ocamorph src/wrappers/ocastem" \
    && make -C ocamorph install SUBDIRS="src/lib src/wrappers/ocamorph src/wrappers/ocastem" \
    && rm -rf ocamorph

# Pyphen

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python get-pip.py \
    && rm get-pip.py \
    && pip install pyphen
