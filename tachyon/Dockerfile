FROM tutum/ubuntu:trusty

MAINTAINER Ivo Jimenez <ivo.jimenez@gmail.com>

# install deps
RUN apt-get update && apt-get install -y git openjdk-7-jdk curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /debian

# * modify sshd conf
# * workaround for the way ubuntu deals with env for sudo
# * add /ceph to PATH
# * create expected dirs/links
RUN sed -i "s/UsePAM.*/UsePAM yes/" /etc/ssh/sshd_config && \
    echo "PATH=/ceph/src:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/ceph/bin" >> /etc/environment && \
    echo "alias sudo='sudo env PATH=\$PATH'" >> /etc/environment && \
    sed -i "s/Defaults.*env_reset//" /etc/sudoers && \
    sed -i "s/Defaults.*secure_path.*//" /etc/sudoers 

# override tutum's run.sh with our own
ADD run.sh /run.sh
