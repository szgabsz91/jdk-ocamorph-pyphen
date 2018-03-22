#!/usr/bin/env bash

function publish() {
    echo "Publishing for version $1"
    docker login -u "$DOCKERHUB_USERNAME" -p "$DOCKERHUB_PASSWORD"
    docker tag jdk-ocamorph-pyphen szgabsz91/jdk-ocamorph-pyphen:$1
    docker push szgabsz91/jdk-ocamorph-pyphen:$1
}

BRANCH=${TRAVIS_PULL_REQUEST_BRANCH:-${TRAVIS_BRANCH}}

echo "TRAVIS_TAG: $TRAVIS_TAG"
echo "TRAVIS_PULL_REQUEST_BRANCH: $TRAVIS_PULL_REQUEST_BRANCH"
echo "TRAVIS_BRANCH: $TRAVIS_BRANCH"
echo "BRANCH: $BRANCH"

if [[ $BRANCH == "master" ]]; then
    # master branch - latest version
    publish "latest"
elif [ ! -z "$TRAVIS_TAG" ]; then
    # tag - cut version from the tag
    publish $(echo $TRAVIS_TAG | cut -d '-' -f 4)
else
    echo "Not pushing Docker image from a feature branch"
fi
