ARG WINBASE
FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS build
WORKDIR /src
COPY . .
RUN dotnet publish -c release -o app -r win10-x64 --self-contained true /p:PublishTrimmed=true /p:PublishReadyToRun=true /p:PublishSingleFile=true

FROM ${WINBASE}
ENTRYPOINT [ "app.exe" ]
COPY --from=build /src/app/dotnet.exe app.exe