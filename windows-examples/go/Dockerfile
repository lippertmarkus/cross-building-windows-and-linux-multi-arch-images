ARG WINBASE
FROM --platform=$BUILDPLATFORM golang:alpine AS build
WORKDIR /src
COPY . .
RUN GOOS=windows go build -o app -v ./... 

FROM ${WINBASE}
ENTRYPOINT [ "app.exe" ]
COPY --from=build /src/app app.exe