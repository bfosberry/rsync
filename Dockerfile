FROM ubuntu
MAINTAINER bfosberry

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq \
    rsync

EXPOSE 873
ADD ./run /usr/local/bin/run

ENTRYPOINT ["/usr/local/bin/run"]
