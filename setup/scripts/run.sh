#!/bin/bash

MAPPINGS_BIND_DIR=/home/wiremock-symlink/mappings/00-CUSTOM
FILES_BIND_DIR=/home/wiremock-symlink/__files/dynamic

ln -s /home/wiremock/mappings/ $MAPPINGS_BIND_DIR
ln -s /home/wiremock/__files/ $FILES_BIND_DIR

# to change the default wiremock options use the environment variable  e.g. -e WIREMOCK_OPTS="--global-response-templating"
echo ""
echo "==== WIREMOCK_OPTS ======"
echo " change parameters passed to wiremock with the environment variable WIREMOCK_OPTS "
echo ""
if [ -z "${WIREMOCK_OPTS}" ]; then
  WIREMOCK_OPTS="--local-response-templating --verbose"
fi
echo " - WIREMOCK_OPTS used : $WIREMOCK_OPTS"
echo "=========================="

PARMETERS=( "${@}" )
PARAMETERS+=("${WIREMOCK_OPTS}")

. /docker-entrypoint.sh $PARAMETERS
