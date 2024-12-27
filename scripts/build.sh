#!/usr/bin/env bash
set -e

# Set the image name
IMAGE_NAME="my_fastapi_app"

echo "Building Docker image: $IMAGE_NAME"
docker build -t "$IMAGE_NAME" .

echo "Docker image '$IMAGE_NAME' built successfully."
