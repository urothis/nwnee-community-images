ARG NWN_VERSION
# nwnsc compiler
FROM urothis/nwnee-community-images:nwnsc-${NWN_VERSION} as nwnsc
# nwn files
FROM beamdog/nwserver:$NWN_VERSION AS nwn
# nim image
FROM debian:bullseye
LABEL maintainer "urothis@gmail.com"
ENV NWN_ROOT=/nwn/data
ENV PATH=/root/.nimble/bin:$PATH
RUN apt update && apt install curl gcc git sqlite3 wget xz-utils -y && \
  curl https://nim-lang.org/choosenim/init.sh -sSf > /tmp/init.sh; sh /tmp/init.sh -y; rm /tmp/init.sh && \
  rm -rf /var/lib/apt/lists/*
RUN apt update && apt install git
COPY --from=nwnsc usr/local/bin/nwnsc usr/local/bin/nwnsc
COPY --from=nwn /nwn/data /nwn/data
