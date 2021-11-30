# Examples for cross-building multi-arch images for Windows and Linux on Linux

Details see blogpost: https://lippertmarkus.com/2021/11/30/win-multiarch-img-lin/

**Example for cross-building and pushing multi-arch image for several Linux architectures AND Windows versions for a Go application**
```bash
cd windows-and-linux-example/
./build.sh myrepository/myapp:mytag  # may run docker login before
```

**Exampe for cross-building and pushing multi-arch image for several Windows versions for .NET, Go, Rust applications, apps with external deps and traefik reverse proxy**
```bash
cd windows-examples/dotnet/  # or go, rust, traefik, external-deps subfolder
../build.sh myrepository/myapp:mytag  # may run docker login before
```
