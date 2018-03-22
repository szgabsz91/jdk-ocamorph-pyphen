#!/usr/bin/env bash

docker build -t jdk-ocamorph-pyphen ./src
docker build -t jdk-ocamorph-pyphen-test ./test
