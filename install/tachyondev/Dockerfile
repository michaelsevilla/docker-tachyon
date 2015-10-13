FROM tutum/ubuntu:trusty

# adapted from David Zhu's version: yuzhu/tachyon-base
# adapted Ivo Jimenez's version: https://github.com/ivotron/docker-cephdev
MAINTAINER Michael Sevilla

# install deps, java stuff FROM maven:3.3.3-jdk-7
ENV TACHYON_VERSION 0.7.1
#ENV JAVA_DEBIAN_VERSION 7u79-2.5.6-1~deb8u1
ENV JAVA_VERSION 7u79
ENV LANG C.UTF-8
ENV MAVEN_VERSION 3.3.3
RUN apt-get update && apt-get install -y git openssh-client openssh-server unzip openjdk-7-jdk curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /debian && \
    curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share   && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn && \
    echo "MAVEN_HOME=/usr/share/maven" >> /etc/environment

# * modify sshd conf
# * workaround for the way ubuntu deals with env for sudo
# * add /ceph to PATH
# * create expected dirs/links
RUN sed -i "s/UsePAM.*/UsePAM yes/" /etc/ssh/sshd_config && \
    echo "PATH=/opt/tachyon/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/ceph/bin" > /etc/environment && \
    echo "JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-amd64/" >> /etc/environment && \
    echo "alias sudo='sudo env PATH=\$PATH'" >> /etc/environment && \
    sed -i "s/Defaults.*env_reset//" /etc/sudoers && \
    sed -i "s/Defaults.*secure_path.*//" /etc/sudoers #&& \
    #mvn install && \

# override tutum's run.sh with our own
ADD run.sh /run.sh


