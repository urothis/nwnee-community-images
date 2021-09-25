ARG NWN_VERSION=dev
ARG IMAGE
FROM beamdog/nwserver:$NWN_VERSION AS nwn
FROM $IMAGE
LABEL maintainer "urothis@gmail.com"
ENV NWN_ARCH linux-x86
RUN apt-get update && \
  apt-get --no-install-recommends -y install libc6 libstdc++6 && \
  rm -r /var/cache/apt /var/lib/apt/lists
RUN mkdir -p /nwn/data && \
 mkdir -p /nwn/home && \
 mkdir -p /nwn/run
COPY --from=nwn /nwn/data/data /nwn/data/data
COPY --from=nwn /nwn/data/lang /nwn/data/lang
COPY --from=nwn /nwn/data/bin/${NWN_ARCH} /nwn/data/bin/${NWN_ARCH}
COPY --from=nwn /nwn/run-server.sh /nwn/prep-nwn-ini.awk /nwn/prep-nwnplayer-ini.awk /nwn/
RUN chmod +x /nwn/data/bin/${NWN_ARCH}/nwserver-linux && \
    chmod +x /nwn/run-server.sh
VOLUME /nwn/home
ENV NWN_TAIL_LOGS=y
ENV NWN_EXTRA_ARGS="-userdirectory /nwn/run"
WORKDIR /nwn/data/bin/${NWN_ARCH}
ENTRYPOINT ["/bin/bash", "/nwn/run-server.sh"]