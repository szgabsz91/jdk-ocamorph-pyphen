#!/usr/bin/env bash

docker build -t jdk9-ocamorph-pyphen ./src
docker build -t jdk9-ocamorph-pyphen-test ./test
