FROM alpine

ARG BUILD_DATE

LABEL org.opencontainers.image.authors="bitcoder2021@gmail.com" \
      org.opencontainers.image.source="https://github.com/bitcoder2021/rke_airgap_install" \
      org.opencontainers.image.created=$BUILD_DATE \
      org.opencontainers.image.title="bitcoder2021/rke_airgap" \
      org.opencontainers.image.description="A simple script to pull down all the off line"  \
      org.opencontainers.image.build="docker build -t bitcoder2021/rancher_airgap --build-arg BUILD_DATE=$(date +%D) ." \
      org.opencontainers.image.run="docker run --rm -v /opt/rancher/:/opt/rancher/ bitcoder2021/rancher_airgap" 

RUN apk -U add curl skopeo openssl bash

WORKDIR /

COPY air_gap_all_the_things.sh /

ENTRYPOINT [ "/air_gap_all_the_things.sh build" ]