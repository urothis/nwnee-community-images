ARG NWN_VERSION
FROM urothis/nwnee-community-images:ci-base-${NWN_VERSION}
LABEL maintainer "urothis@gmail.com"
WORKDIR /build
ENV PATH="/home/NWNT/.nimble/bin:$PATH"
RUN git clone https://github.com/WilliamDraco/NWNT.git && cd NWNT && nimble build -d:release -y
ENTRYPOINT ["/build/NWNT/nwn_nwnt"]
CMD ["--version"]
