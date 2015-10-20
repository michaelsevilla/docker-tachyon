FROM tutum/ubuntu:trusty

MAINTAINER Ivo Jimenez <ivo.jimenez@gmail.com>

# install deps
ENV TACHYON_VERSION 0.7.1
ENV JAVA_VERSION 7u79
ENV LANG C.UTF-8
ENV MAVEN_VERSION 3.3.3
RUN wget https://raw.githubusercontent.com/ceph/ceph/master/install-deps.sh && \
    wget https://raw.githubusercontent.com/ceph/ceph/master/debian/control && \
    apt-get update && apt-get install -y git openjdk-7-jdk curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /debian && \
    curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share  && \
    mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn && \
    echo "MAVEN_HOME=/usr/share/maven" >> /etc/environment

# * modify sshd conf
# * workaround for the way ubuntu deals with env for sudo
# * add /ceph to PATH
# * create expected dirs/links
RUN sed -i "s/UsePAM.*/UsePAM yes/" /etc/ssh/sshd_config && \
    echo "PATH=/ceph/src:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/ceph/bin" >> /etc/environment && \
    echo "alias sudo='sudo env PATH=\$PATH'" >> /etc/environment && \
    sed -i "s/Defaults.*env_reset//" /etc/sudoers && \
    sed -i "s/Defaults.*secure_path.*//" /etc/sudoers 

# create ssh keys
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -N '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
    echo "Port 2222" >> /etc/ssh_config

# override tutum's run.sh with our own
ADD run.sh /run.sh
