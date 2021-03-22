# JDK 16

FROM openjdk:16-jdk-slim-buster

# Dependencies

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        cvs \
        ocaml-nox \
        ocaml-findlib \
        python3 \
        python3-pip \
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

RUN pip3 install pyphen
