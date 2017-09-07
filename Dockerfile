FROM maven:3.5-jdk-8-alpine

RUN mkdir /etc/doctor-kafka
WORKDIR /etc/doctor-kafka

RUN apk -U --no-cache add --virtual .build-dependencies ca-certificates wget && update-ca-certificates && \
    cd /tmp && \
    wget https://github.com/pinterest/doctorkafka/archive/master.tar.gz && \
    tar -zxvf master.tar.gz && \
    rm master.tar.gz && \
    cd doctorkafka-master && \
    mvn package -pl drkafka -am -Dmaven.test.skip=true && \
    mv drkafka/target/* /etc/doctor-kafka/. && \
    rm -rf /tmp/doctorkafka-master && \
    apk del .build-dependencies
