FROM maven:3.3.3-jdk-7

# Adapted from David Zhu's version: yuzhu/tachyon-base
MAINTAINER Michael Sevilla

# Get Tachyon from github release.
ENV TACHYON_VERSION 0.7.1
ENV PATH $PATH:/opt/tachyon/bin
ENV JAVA_HOME /usr/lib/jvm/java-1.7.0-openjdk-amd64/ 

RUN mkdir -p /opt && \
    # link the tachyon source 
    ln -s tachyon-$TACHYON_VERSION tachyon && \
    cd tachyon && \
    #mvn install && \
    echo Tachyon installed in /opt
    cp -r /conf/ tachyon/conf

