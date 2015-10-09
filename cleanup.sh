#! /bin/bash

docker ps -aq | xargs docker rm 2>/dev/null
docker images | xargs docker rmi 2>/dev/null
