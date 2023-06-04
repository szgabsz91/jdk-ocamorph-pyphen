#!/usr/bin/env bash

echo "Publishing for version $1"
docker tag jdk-ocamorph-pyphen szgabsz91/jdk-ocamorph-pyphen:$1
echo "$DOCKERHUB_PASSWORD" | docker login -u "$DOCKERHUB_USERNAME" --password-stdin
docker push szgabsz91/jdk-ocamorph-pyphen:$1
