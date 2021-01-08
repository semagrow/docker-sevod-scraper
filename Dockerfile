FROM maven:3.3.3-jdk-8 as build

MAINTAINER Antonis Troumpoukis <antru@iit.demokritos.gr>

WORKDIR build

RUN git clone https://github.com/semagrow/sevod-scraper.git \
 && cd sevod-scraper \
 && mvn clean package \
 && cd assembly/target \
 && tar xzvf sevod-scraper-*-SNAPSHOT-dist.tar.gz

FROM openjdk:8-jre-slim-buster

COPY --from=build /build/sevod-scraper/assembly/target/bin /sevod-scraper/bin
COPY --from=build /build/sevod-scraper/assembly/target/lib /sevod-scraper/lib
 
WORKDIR /sevod-scraper/bin

COPY run-sevod-scraper.sh ./run-sevod-scraper.sh

RUN chmod +x ./run-sevod-scraper.sh

ENTRYPOINT ./run-sevod-scraper.sh
