Wraps a given Tachyon codebase in a container that can be seen as a Tachyon remote (a.k.a. test node). This is basically build dependencies, plus an sshd, plus environment setup so that (1) the experiment master can communicate with the container via SSH and (2) binaries built from source are in the PATH.

===================================================
Quickstart
===================================================

To build Tachyon:

    docker ps -aq | xargs docker stop
    docker ps -aq | xargs docker rm
    docker run -it \
        --name tachyonbuild-test \
        -v /tmp/docker/tachyon:/tachyon \
        tachyonbuild-test
    
To start Tachyon server:

    docker ps -aq | xargs docker stop
    docker ps -aq | xargs docker rm
    docker run -it \
        --name tachyonbuild-test \
        --net=host \
        -v /tmp/docker/tachyon:/tachyon \
        --entrypoint=/bin/bash \
        tachyonbuild-test


