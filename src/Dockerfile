# Ocamorph

FROM debian:buster-slim as ocamorph
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        cvs \
        ocaml-nox \
        ocaml-findlib \
    && rm -rf /var/lib/apt/lists/*
RUN cvs -d :pserver:anonymous:anonymous@cvs.mokk.bme.hu:/local/cvs co ocamorph
RUN make -C ocamorph SUBDIRS="src/lib src/wrappers/ocamorph src/wrappers/ocastem" \
    && make -C ocamorph install SUBDIRS="src/lib src/wrappers/ocamorph src/wrappers/ocastem" \
    && rm -rf ocamorph

# Pyphen

FROM python:3.9.12-slim-buster
RUN pip3 install pyphen

# Copy from previous stages

COPY --from=ocamorph /usr/bin/ocamorph /usr/bin/ocamorph
COPY --from=openjdk:17-jdk-slim-buster /usr/local/openjdk-17 /usr/local/openjdk-17

# Set up JDK

ENV JAVA_HOME /usr/local/openjdk-17
RUN update-alternatives --install /usr/bin/java java /usr/local/openjdk-17/bin/java 1
RUN update-alternatives --install /usr/bin/javac javac /usr/local/openjdk-17/bin/javac 1
