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
assertVersion "java --version" openjdk[[:space:]]15\.
assertVersion "javac --version" javac[[:space:]]15\.
assertVersion "python3 --version" Python[[:space:]]3\.
assertVersion "ocamorph --version" 0.1

echo "Checking pyphen"
pyphenVersion=`pip3 freeze | grep Pyphen`
echo $pyphenVersion
if [ "$pyphenVersion" != "Pyphen==0.9.5" ]; then
    echo "Failed"
    exit -1
fi

echo "Checking Git"
git --version
