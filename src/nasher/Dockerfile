ARG NWN_VERSION
FROM urothis/nwnee-community-images:ci-base-${NWN_VERSION}
LABEL maintainer "urothis@gmail.com"
WORKDIR /nasher
RUN nimble install nasher@#head -y
RUN bash -c "mkdir -pv /nasher/install/{erf,hak,modules,tlk}"
ENTRYPOINT [ "nasher" ]
CMD [ "--help" ]
