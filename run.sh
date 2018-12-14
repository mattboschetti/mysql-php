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

docker tag ${IMAGE_NAME} ${VERSIONED_IMAGE_NAME}

docker push ${IMAGE_NAME}
docker push ${VERSIONED_IMAGE_NAME}
