FROM pi4k8s/openjdk8:centos7

ADD apiworld-mock-server.jar /opt

ENV JAVA_OPTS "-Xms128m -Xmx128m"

WORKDIR /opt

ENTRYPOINT java ${JAVA_OPTS} -jar apiworld-mock-server.jar
