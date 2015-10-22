docker ps -aq | xargs docker stop
docker ps -aq | xargs docker rm
docker run -it \
    --name tachyonbuild-test \
    -e SHA1_OR_REF=origin/branch-0.7 \
    -v /tmp/docker/tachyon:/tachyon \
    tachyonbuild-test

