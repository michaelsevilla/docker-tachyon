#!/bin/bash

docker ps -aq | xargs docker stop   >> /dev/null 2>&1
docker ps -aq | xargs docker rm -f  >> /dev/null 2>&1

docker run \
  --name remote0 \
  -d \
  -p 2222:22 \
  -e AUTHORIZED_KEYS="`cat ~/.ssh/id_rsa.pub`" \
  -v `pwd`:/ceph \
  -v /dev:/dev \
  -v /tmp/ceph_data/$RANDOM:/var/lib/ceph \
  --cap-add=SYS_ADMIN --privileged \
  --device /dev/fuse \
  tachyon 



  #-e SSHD_PORT=2222 \
#  --net=host \
