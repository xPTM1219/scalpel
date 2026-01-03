FROM ubuntu:24.04

RUN apt update && \
  apt install -y -qq --no-install-recommends \
      automake \
      autoconf \
      default-jdk \
      gcc \
      g++ \
      libtool \
      libtre-dev \
      libtre5 \
      make \
      tre-agrep \
      unzip && \
  rm -rf /var/lib/apt/lists/*

COPY . /scalpel
WORKDIR /scalpel
RUN ./bootstrap && ./configure --disable-shared && make
ENTRYPOINT ["/scalpel/entrypoint.sh"]

