#!/bin/bash

set -x

DOCKER_IMAGE=retzero/tizen-studio:3.7-5.5
CONTAINER_NAME=builder_ct

## command
#$1
## source
#$2 working_directory
## package
#$3 strip
#$4 output
#$5 reference
#$6 security_profile
#$7 packaging_type
## build-native
#$8 build_mode
#$9 architecture
#$10 compiler
#$11 symbol
#$12 extra_option
#$13 jobs
#$14 rootstrap_name
#$15 strip
## build-web
#$16 exclude
#$17 optimize
## security-profile
#$18 cert_name
#$19 author_cert_path
#$20 author_certi_pass
#$21 distributor_cert_path
#$22 distributor_certi_pass


docker pull ${DOCKER_IMAGE}

docker run -id --name ${CONTAINER_NAME} --workdir ${GITHUB_WORKSPACE} ${DOCKER_IMAGE}

# FIXME: Try volume mounting instead of copy files.
docker cp ${GITHUB_WORKSPACE}/. ${CONTAINER_NAME}:${GITHUB_WORKSPACE}

docker exec -i ${CONTAINER_NAME} tizen ${1} -r ${14} -C ${8} -c ${10} -a ${9} -- ${GITHUB_WORKSPACE}

docker stop ${CONTAINER_NAME}

docker rm ${CONTAINER_NAME}
