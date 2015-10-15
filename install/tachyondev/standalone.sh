#!/bin/bash

docker ps -aq | xargs docker stop   >> /dev/null 2>&1
docker ps -aq | xargs docker rm -f  >> /dev/null 2>&1

docker run \
  --name remote0 \
  -d \
  -p 2222:22 \
  -e AUTHORIZED_KEYS="`cat ~/.ssh/id_rsa.pub`" \
  -v /dev:/dev \
  -v /tmp/docker/tachyon:/opt/tachyon \
  --cap-add=SYS_ADMIN --privileged \
  --device /dev/fuse \
  tachyon 

