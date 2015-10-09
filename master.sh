#! /bin/bash

#sudo apt-get update
#sudo apt-get install python-setuptools
#sudo easy_install pip
#sudo pip install docker-py

# clear out existing docker containers
mkdir /tmp/docker >> /dev/null 2>&1
echo "Installing an Ansible Docker container and dropping you into an 'experiment shell'"
docker run -t -i \
  --name="emaster" \
  --hostname="experiment_master" \
  --volume="`pwd`:/hathisar-dev/" \
  --volume="/tmp/:/tmp/" \
  --workdir="/hathisar-dev/experiments" \
  michaelsevilla/hathisar-dev:emaster \
  /bin/bash
