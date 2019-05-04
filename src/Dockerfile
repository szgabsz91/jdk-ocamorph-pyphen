# CentOS

FROM centos:7

# Locale

RUN localedef -c -f UTF-8 -i en_US en_US.UTF-8
ENV LC_ALL "en_US.UTF-8"

# Set up OpenJDK (normally it would be FROM openjdk-12-jdk-slim but it is not available yet)

RUN curl -O https://download.java.net/java/GA/jdk12.0.1/69cfe15208a647278a19ef0990eea691/12/GPL/openjdk-12.0.1_linux-x64_bin.tar.gz \
    && tar xf openjdk-12.0.1_linux-x64_bin.tar.gz \
    && mv jdk-12.0.1 /opt \
    && rm openjdk-12.0.1_linux-x64_bin.tar.gz
ENV JAVA_HOME "/opt/jdk-12.0.1"
ENV PATH "${PATH}:${JAVA_HOME}/bin"

# Dependencies

RUN yum install -y \
        gcc \
        make \
        cvs \
        ocaml \
        ocaml-findlib \
    && yum clean all

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
