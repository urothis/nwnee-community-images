ARG NWN_VERSION
FROM urothis/nwnee-community-images:ci-base-${NWN_VERSION}
WORKDIR /build
ENV PATH="/home/nwn_2da_tlkify/.nimble/bin:$PATH"
RUN git clone https://github.com/Morderon/nwn_2da_tlkify.git && cd nwn_2da_tlkify && nimble build -d:release -y
ENTRYPOINT ["/build/nwn_2da_tlkify/bin/nwn_2da_tlkify"]
CMD ["--version"]
