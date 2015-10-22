FROM maven:3.3.3-jdk-7

MAINTAINER Ivo Jimenez <ivo.jimenez@gmail.com>

# install deps
RUN apt-get update && apt-get install -y git openjdk-7-jdk curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /debian

ADD build /
RUN chmod 755 /build
ENTRYPOINT ["/build"]
