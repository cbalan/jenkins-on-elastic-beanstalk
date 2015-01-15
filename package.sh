#!/bin/bash -ex

VERSION=${VERSION:=$(date +%Y%m%d%H%M)}
TARGET=${TARGET:=$(pwd)/target/}

mkdir -p ${TARGET}
zip -r ${TARGET}/jenkins-${VERSION}.zip .ebextensions jenkins_home Dockerfile Dockerrun.aws.json entrypoint.sh
