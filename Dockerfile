FROM grafana/grafana
MAINTAINER Heinz N. Gies <heinz@project-fifo.net>

RUN apt-get update && apt-get install -y --no-install-recommends git && rm -rf /var/lib/apt/lists/*

ENV PLUGIN_DIR=/plugins

RUN mkdir -p $PLUGIN_DIR

ENV VNS=v1.0.5

RUN cd $PLUGIN_DIR \
    && env GIT_SSL_NO_VERIFY=true git clone https://github.com/dalmatinerdb/dalmatinerdb-datasource dalmatinerdb \
    && cd dalmatinerdb \
    && env GIT_SSL_NO_VERIFY=true git checkout $VNS
