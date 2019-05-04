#!/usr/bin/env bash

docker build -t jdk-ocamorph-pyphen-test ./test
docker run -t jdk-ocamorph-pyphen-test
