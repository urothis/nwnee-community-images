ARG NWN_VERSION
FROM beamdog/nwserver:${NWN_VERSION} AS nwn

FROM debian:bullseye AS build
WORKDIR /build
RUN apt update && apt install git cmake bison build-essential -y && git clone https://github.com/nwneetools/nwnsc.git
WORKDIR /build/nwnsc
RUN cmake . && make all

FROM debian:bullseye-slim
COPY --from=nwn /nwn/data /nwn/data
COPY --from=build /build/nwnsc/nwnsc /usr/local/bin/
ENTRYPOINT ["nwnsc", "-on", "/nwn/data"]
CMD ["*.nss"]
