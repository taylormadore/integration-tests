FROM docker.io/library/golang@sha256:2c5f7a0c252a17cf6aa30ddee15caa0f485ee29410a6ea64cddb62eea2b07bdf AS go-builder

WORKDIR /src
COPY . .
RUN go build -o /usr/bin/retrodep

FROM registry.access.redhat.com/ubi9-minimal@sha256:53ea1f6d835898acda5becdb3f8b1292038a480384bbcf994fc0bcf1f7e8eaf7

COPY --from=go-builder /usr/bin/retrodep /usr/bin/retrodep

ENTRYPOINT ["/usr/bin/retrodep"]
