ARG WINBASE
FROM --platform=$BUILDPLATFORM curlimages/curl:7.80.0 AS build
WORKDIR /src
RUN curl -Lo traefik.zip https://github.com/traefik/traefik/releases/download/v2.5.4/traefik_v2.5.4_windows_amd64.zip ; \
    unzip traefik.zip

FROM ${WINBASE}
ENTRYPOINT [ "traefik.exe" ]
COPY --from=build /src/traefik.exe traefik.exe