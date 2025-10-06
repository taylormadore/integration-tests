FROM docker.io/library/golang@sha256:2c5f7a0c252a17cf6aa30ddee15caa0f485ee29410a6ea64cddb62eea2b07bdf AS go-builder

WORKDIR /src
COPY . .
RUN go build -o /usr/bin/retrodep

FROM registry.access.redhat.com/ubi9-minimal@sha256:7c5495d5fad59aaee12abc3cbbd2b283818ee1e814b00dbc7f25bf2d14fa4f0c

COPY --from=go-builder /usr/bin/retrodep /usr/bin/retrodep

ENTRYPOINT ["/usr/bin/retrodep"]
