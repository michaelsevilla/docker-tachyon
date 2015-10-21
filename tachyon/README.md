Wraps a given Tachyon codebase in a container that can be seen as a Tachyon remote (a.k.a. test node). This is basically build dependencies, plus an sshd, plus environment setup so that (1) the experiment master can communicate with the container via SSH and (2) binaries built from source are in the PATH.

===================================================
Quickstart
===================================================

To launch a node with Tachyon installed:

    docker run \
      --name remote0 \
      -d \
      -e SSHD_PORT=2222 \
      -e AUTHORIZED_KEYS="`cat ~/.ssh/id_rsa.pub`" \
      --net=host \
      -v /tmp/docker/tachyon:/tachyon \
      --cap-add=SYS_ADMIN --privileged \
      michaelsevilla/tachyondev



