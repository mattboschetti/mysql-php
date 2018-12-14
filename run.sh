#!/usr/bin/env bash

function die() {
  echo $1
  exit 1
}

[ -z $1 ] && die "Inform the image version"

IMAGE_VERSION=$1
IMAGE_NAME=mattboschetti/mysql-php
VERSIONED_IMAGE_NAME=${IMAGE_NAME}:${IMAGE_VERSION}

docker build -t $IMAGE_NAME .

[ $? != 0 ] && die "Error building docker image!"

docker tag ${IMAGE_NAME} ${VERSIONED_IMAGE_NAME}

[ $? != 0 ] && die "Error tagging docker image!"

docker push ${IMAGE_NAME}

[ $? != 0 ] && die "Error pushing latest docker image!"

docker push ${VERSIONED_IMAGE_NAME}

[ $? != 0 ] && die "Error pushing versioned docker image!"

echo "All good!"