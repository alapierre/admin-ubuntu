FROM ubuntu:22.04

RUN apt update && \
    apt install -y curl git vim apache2-utils moreutils gettext-base traceroute && \
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

RUN sed -i --regexp-extended 's http://(archive\.ubuntu\.com|security\.ubuntu\.com) https://ftp.uni-stuttgart.de g' /etc/apt/sources.list \
      && apt-get -o Acquire::https::Verify-Peer=false -yqq update \
      && apt-get -o Acquire::https::Verify-Peer=false install -y --no-install-recommends ca-certificates
