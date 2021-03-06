#!/usr/bin/env bash

# The Set Builtin
# https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
[ "$DEBUG" == 'true' ] && set -x

echo ""

if [[ -z "${JEKYLL_SITE_DIR}" ]]; then
  echo "\$JEKYLL_SITE_DIR is not defined."
  JEKYLL_SITE_DIR="${PWD}/../praqma.com"
fi
echo "\$JEKYLL_SITE_DIR: ${JEKYLL_SITE_DIR}"

if [[ -z "${DOCKER_IMAGE_NAME}" ]]; then
  echo "\$DOCKER_IMAGE_NAME is not defined."
  DOCKER_IMAGE_NAME="praqma/jekyll:latest"
fi
echo "\$DOCKER_IMAGE_NAME: ${DOCKER_IMAGE_NAME}"

echo ""

docker run \
  --rm \
  --tty \
  --user $(id -u):$(id -g) \
  --volume $JEKYLL_SITE_DIR:/website:rw \
  --workdir /website \
  $DOCKER_IMAGE_NAME \
  jekyll new .
