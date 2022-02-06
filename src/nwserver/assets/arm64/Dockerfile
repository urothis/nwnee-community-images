ARG IMAGE
FROM beamdog/nwserver:8193.34 AS nwn
FROM $IMAGE
LABEL maintainer "urothis@gmail.com"
ENV NWN_ARCH linux-x86
RUN mkdir -p /nwn/data && \
 mkdir -p /nwn/home && \
 mkdir -p /nwn/run
COPY --from=nwn /nwn/data/data /nwn/data/data
COPY --from=nwn /nwn/data/lang /nwn/data/lang
COPY --from=nwn /nwn/data/bin/${NWN_ARCH} /nwn/data/bin/${NWN_ARCH}
COPY --from=nwn /nwn/prep-nwn-ini.awk /nwn/prep-nwnplayer-ini.awk /nwn/
# custom arm bits #
COPY run-server.sh /nwn
COPY 8193_34/nwserver /nwserver-linux
###################
RUN chmod +x /nwn/data/bin/${NWN_ARCH}/nwserver-linux && \
    chmod +x /nwn/run-server.sh
VOLUME /nwn/home
ENV NWN_TAIL_LOGS=y
ENV NWN_EXTRA_ARGS="-userdirectory /nwn/run"
WORKDIR /nwn/data/bin/${NWN_ARCH}
ENTRYPOINT ["/bin/bash", "/nwn/run-server.sh"]