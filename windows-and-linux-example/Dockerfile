# dummy value for linux builds
ARG WINBASE=scratch

FROM --platform=$BUILDPLATFORM golang:alpine AS build
WORKDIR /src
COPY . .
RUN go get -d -v ./...
RUN if [ "$TARGETARCH" = "arm" ]; then export GOARM="${TARGETVARIANT//v}"; fi; \
    GOOS=$TARGETOS GOARCH=$TARGETARCH go build -o app -v ./... ; \
    chmod +x app


FROM ${WINBASE} AS windows
ENTRYPOINT [ "app.exe" ]
COPY --from=build /src/app app.exe


FROM scratch AS linux
ENTRYPOINT [ "/app" ]
COPY --from=build /src/app /app