#!/bin/bash

# Define image and container names
PROJECT_NAME=${PWD##*/}
TEST_IMAGE_NAME="$PROJECT_NAME:test"
TEST_CONTAINER_NAME="test-$PROJECT_NAME"

# Stop test container if it is running
if $(docker ps | grep -q $TEST_CONTAINER_NAME); then
  docker stop $TEST_CONTAINER_NAME
fi

# Remove test container if it exists
if $(docker ps -a | grep -q $TEST_CONTAINER_NAME); then
  docker rm $TEST_CONTAINER_NAME
fi

# Remove test image if it exists
if [[ "$(docker images -q $TEST_IMAGE_NAME 2> /dev/null)" != "" ]]; then
  docker rmi $TEST_IMAGE_NAME
fi

# Build image
docker build --tag=$TEST_IMAGE_NAME .

# Run container
mkdir ./test-notebooks
docker run --rm -it --name $TEST_CONTAINER_NAME -p 8080:8888 -v ${PWD}/test-notebooks:/opt/notebooks $TEST_IMAGE_NAME
