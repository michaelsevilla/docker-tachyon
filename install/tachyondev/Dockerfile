FROM maven:3.3.3-jdk-7

# adapted from David Zhu's version: yuzhu/tachyon-base
# adapted Ivo Jimenez's version: https://github.com/ivotron/docker-cephdev
MAINTAINER Michael Sevilla

# install deps
RUN apt-get update && apt-get install -y git openssh-client openssh-server &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /debian

# * modify sshd conf
# * workaround for the way ubuntu deals with env for sudo
# * add /ceph to PATH
# * create expected dirs/links
RUN sed -i "s/UsePAM.*/UsePAM yes/" /etc/ssh/sshd_config && \
    echo "PATH=/opt/tachyon/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/ceph/bin" > /etc/environment && \
    echo "JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-amd64/" >> /etc/environment && \
    echo "TACHYON_VERSION=0.7.1" >> /etc/environment && \
    echo "alias sudo='sudo env PATH=\$PATH'" >> /etc/environment && \
    sed -i "s/Defaults.*env_reset//" /etc/sudoers && \
    sed -i "s/Defaults.*secure_path.*//" /etc/sudoers #&& \
    #mvn install && \

# override tutum's run.sh with our own
ADD run.sh /run.sh

#CREATED BY                                                                                                                                                                                                                                                                     SIZE                COMMENT
# /bin/sh -c #(nop) CMD ["mvn"]                                                                                                                                                                                                                                                  0 B                 
# /bin/sh -c #(nop) ENV MAVEN_HOME=/usr/share/maven                                                                                                                                                                                                                              0 B                 
# /bin/sh -c curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share   && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven   && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn   9.504 MB            
# /bin/sh -c #(nop) ENV MAVEN_VERSION=3.3.3                                                                                                                                                                                                                                      0 B                 
# /bin/sh -c apt-get update && apt-get install -y openjdk-7-jdk="$JAVA_DEBIAN_VERSION" && rm -rf /var/lib/apt/lists/*                                                                                                                                                            294.7 MB            
# /bin/sh -c #(nop) ENV JAVA_DEBIAN_VERSION=7u79-2.5.6-1~deb8u1                                                                                                                                                                                                                  0 B                 
# /bin/sh -c #(nop) ENV JAVA_VERSION=7u79                                                                                                                                                                                                                                        0 B                 
# /bin/sh -c #(nop) ENV LANG=C.UTF-8                                                                                                                                                                                                                                             0 B                 
# /bin/sh -c apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/*                                                                                                                                                                                           789.4 kB            
# /bin/sh -c apt-get update && apt-get install -y --no-install-recommends                                                                                                                                                                                                                            bzr                                     git                                     mercurial                                            openssh-client                          subversion          && rm -rf /var/lib/apt/lists/*   122.3 MB            
# /bin/sh -c apt-get update && apt-get install -y --no-install-recommends                                                                                                                                                                                                                            ca-certificates                         curl                                    wget                && rm -rf /var/lib/apt/lists/*   44.36 MB            
# /bin/sh -c #(nop) CMD ["/bin/bash"]                                                                                                                                                                                                                                            0 B                 
# /bin/sh -c #(nop) ADD file:c7d957020a6ee3df60f2407c7a383cabcfa67d43f6d5151b241b37034f5bc6e0 in /            
