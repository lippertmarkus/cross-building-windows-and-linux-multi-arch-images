ARG WINBASE
FROM ${WINBASE}
ENTRYPOINT [ "wins.exe", "-v" ]
COPY --from=sigwindowstools/kube-proxy:v1.22.4-nanoserver /utils .