#!/usr/bin/env bash

set -e

use_tag="dixneuf19/uvicorn-gunicorn:$NAME"
use_dated_tag="${use_tag}-$(date -I)"

bash scripts/build.sh

bash scripts/docker-login.sh

docker buildx build --platform linux/amd64,linux/arm64,linux/386,linux/arm/v7 -t "$use_tag" --file "./docker-images/${DOCKERFILE}.dockerfile" "./docker-images/" --push
docker buildx build --platform linux/amd64,linux/arm64,linux/386,linux/arm/v7 -t "$use_dated_tag" --file "./docker-images/${DOCKERFILE}.dockerfile" "./docker-images/" --push
