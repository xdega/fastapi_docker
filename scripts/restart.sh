#!/usr/bin/env bash
set -e

CONTAINER_NAME="superfly_fastapi_dev"
IMAGE_NAME="superfly_fastapi"
HOST_PORT=8000
CONTAINER_PORT=8000

echo "Restarting Docker container: $CONTAINER_NAME"

# Stop and remove the old container if it exists
if [ "$(docker ps -aq -f name=^${CONTAINER_NAME}$)" ]; then
  if [ "$(docker ps -q -f name=^${CONTAINER_NAME}$)" ]; then
    echo "Stopping running container: $CONTAINER_NAME"
    docker stop "$CONTAINER_NAME"
  fi
  echo "Removing container: $CONTAINER_NAME"
  docker rm "$CONTAINER_NAME"
fi

# Run a fresh container
docker run -d \
  --name "$CONTAINER_NAME" \
  -p "${HOST_PORT}:${CONTAINER_PORT}" \
  "$IMAGE_NAME"

echo "Container '$CONTAINER_NAME' restarted and running on port $HOST_PORT."
