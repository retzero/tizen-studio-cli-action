#!/bin/bash

set -x

DOCKER_IMAGE=retzero/tizen-studio:3.7-5.5
CONTAINER_NAME=builder_ct

case "$1" in
build-native) echo "Build Native"
  build_mode=""; if [ ! -z $8 ]; then build_mode="-C $8"; fi
  architecture=""; if [ ! -z $9 ]; then architecture="-a $9"; fi
  compiler=""; if [ ! -z ${10} ]; then architecture="-c ${10}"; fi
  rootstrap=""; if [ ! -z ${14} ]; then rootstrap="-r ${14}"; fi
  ;;
build-web) echo "Build Web"
  ;;
package) echo "Package"
  strip=""; if [ ! -z ${3} ]; then strip="--strip ${3}"; fi
  output=""; if [ ! -z ${4} ]; then output="--output ${4}"; fi
  reference=""; if [ ! -z ${5} ]; then reference="--reference ${5}"; fi
  security_profile=""; if [ ! -z ${6} ]; then security_profile="--sign ${6}"; fi
  packaging_type=""; if [ ! -z ${7} ]; then packaging_type="--type ${7}"; fi
  ;;
security-profiles) echo "Security Profiles"
  ;;
list_rootstrap) echo "List Rootstrap"
  ;;
*) echo " $1 : Not processed"
  ;;


docker pull ${DOCKER_IMAGE}

docker run -id --name ${CONTAINER_NAME} --workdir ${GITHUB_WORKSPACE} ${DOCKER_IMAGE}

# FIXME: Try volume mounting instead of copy files.
docker cp ${GITHUB_WORKSPACE}/. ${CONTAINER_NAME}:${GITHUB_WORKSPACE}

docker exec -i ${CONTAINER_NAME} tizen ${1} ${rootstrap} ${build_mode} ${compiler} ${architecture} -- ${GITHUB_WORKSPACE}/${2}

docker stop ${CONTAINER_NAME}

docker rm ${CONTAINER_NAME}
