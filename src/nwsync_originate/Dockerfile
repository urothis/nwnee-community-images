ARG NWN_VERSION
FROM urothis/nwnee-community-images:ci-base-${NWN_VERSION}
WORKDIR /build
ENV PATH="/home/nwsync_originate/.nimble/bin:$PATH"
RUN git clone https://github.com/WilliamDraco/nwsync_originate.git && cd nwsync_originate && nimble build -d:release -y
ENTRYPOINT ["/build/nwsync_originate/nwsync_originate"]
CMD ["--version"]
