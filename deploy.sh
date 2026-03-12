#!/bin/bash

source deploy-config.env

echo "Pulling latest Docker image..."
docker pull $DOCKER_IMAGE:latest

echo "Stopping existing container..."
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

echo "Starting new container..."
docker run -d \
  -p 80:$PORT \
  --name $CONTAINER_NAME \
  $DOCKER_IMAGE:latest

echo "Deployment complete!"
