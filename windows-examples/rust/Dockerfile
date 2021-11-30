ARG WINBASE
FROM --platform=$BUILDPLATFORM rust:alpine AS build
WORKDIR /src
RUN apk add mingw-w64-gcc ; \
    rustup target add x86_64-pc-windows-gnu
COPY . .
RUN cargo build --target x86_64-pc-windows-gnu --release

FROM ${WINBASE}
ENTRYPOINT [ "app.exe" ]
COPY --from=build /src/target/x86_64-pc-windows-gnu/release/app.exe app.exe