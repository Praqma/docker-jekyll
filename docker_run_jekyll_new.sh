#!/usr/bin/env bash

# The Set Builtin
# https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
[ "$DEBUG" == 'true' ] && set -x

docker run \
  --rm \
  --tty \
  --user $(id -u):$(id -g) \
  --volume $JEKYLL_SITE_DIR:/website:rw \
  --workdir /website \
  $DOCKER_IMAGE_NAME \
  jekyll new .
