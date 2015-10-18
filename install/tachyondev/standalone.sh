#!/bin/bash

docker ps -aq | xargs docker stop   >> /dev/null 2>&1
docker ps -aq | xargs docker rm -f  >> /dev/null 2>&1

docker run \
  --name remote0 \
  -d \
  -e SSHD_PORT=2222 \
  -e AUTHORIZED_KEYS="`cat ~/.ssh/id_rsa.pub`" \
  --net=host \
  -v /tmp/docker/tachyon:/tachyon \
  --cap-add=SYS_ADMIN --privileged \
  test
  #michaelsevilla/hathisar-dev:tachyon
