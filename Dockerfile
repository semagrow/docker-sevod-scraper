FROM maven:3.3.3-jdk-8

MAINTAINER Antonis Troumpoukis <antru@iit.demokritos.gr>

RUN git clone https://github.com/semagrow/sevod-scraper.git \
 && cd sevod-scraper \
 && mvn clean package \
 && cd assembly/target \
 && tar xzvf sevod-scraper-*-SNAPSHOT-dist.tar.gz

WORKDIR /sevod-scraper/assembly/target/bin

COPY run-sevod-scraper.sh ./run-sevod-scraper.sh

RUN chmod +x ./run-sevod-scraper.sh

ENTRYPOINT ./run-sevod-scraper.sh
