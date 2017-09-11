#!/bin/bash

cd /etc/doctor-kafka

java -server -cp lib/*:doctorkafka-0.1.0.jar  com.pinterest.doctorkafka.DoctorKafkaMain \
  -config ${PROPERTIES} ${ADDITIONAL_OPTS}
