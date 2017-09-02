#!/usr/bin/env bash

#
# This script builds the image based on ./Dockerfile. The image
# is the executed with the ./run.sh script.
#

echo "Reading environment variables..."
source ./env.sh

echo "Removing old container..."
docker rm -f $CONTAINER_NAME

echo "Removing old image(s)..."
docker rmi -f $CONTAINER_IMAGE

#echo "Copying latest webapp..."
#cp ../../target/mywebapp.war ./mywebapp.war

echo "Building docker image..."
docker build -t $CONTAINER_IMAGE .