#!/usr/bin/env bash

function assertVersion() {
    COMMAND=$1
    echo $COMMAND
    VERSION_STDOUT=$($COMMAND)
    VERSION_STDERR=$(($COMMAND) 2>&1)
    VERSION="$VERSION_STDOUT $VERSION_STDERR"
    echo "Version: $VERSION"
    if [[ "$VERSION" =~ $2 ]];
    then
        echo "Passed"
    else
        echo "Version mismatch"
        exit -1
    fi
}

echo "Checking versions"
assertVersion "java --version" openjdk[[:space:]]9\.
assertVersion "javac --version" javac[[:space:]]9\.
assertVersion "python --version" Python[[:space:]]2\.
assertVersion "ocamorph --version" 0.1

echo "Checking pyphen"
python -c "__import__('imp').find_module('pyphen')"
