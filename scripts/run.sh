#!/usr/bin/env bash
set -e

CONTAINER_NAME="superfly_fastapi_dev"
IMAGE_NAME="superfly_fastapi"
HOST_PORT=8000
CONTAINER_PORT=8000

echo "Running Docker container: $CONTAINER_NAME from image: $IMAGE_NAME"

# -d runs in detached mode (background)
# -p maps host port -> container port
docker run -d \
  --name "$CONTAINER_NAME" \
  -p "${HOST_PORT}:${CONTAINER_PORT}" \
  "$IMAGE_NAME"

echo "Container '$CONTAINER_NAME' is running on port $HOST_PORT."
