ARG NWN_VERSION
FROM urothis/nwnee-community-images:ci-base-${NWN_VERSION}
WORKDIR /build
ENV PATH="/home/nwsync/.nimble/bin:$PATH"
RUN git clone https://github.com/Beamdog/nwsync.git && cd nwsync && nimble build -d:release -y
ENTRYPOINT ["/build/nwsync/bin/nwsync_print"]
CMD ["--version"]
