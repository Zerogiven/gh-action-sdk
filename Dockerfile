ARG CONTAINER=ghcr.io/openwrt/sdk
ARG ARCH=mips_24kc
FROM $CONTAINER:$ARCH

USER root
RUN apt-get update \
 && apt-get install -y --no-install-recommends libclang-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
USER buildbot

LABEL "com.github.actions.name"="OpenWrt SDK"

ADD entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
