FROM docker.io/library/golang@sha256:e68f6a00e88586577fafa4d9cefad1349c2be70d21244321321c407474ff9bf2 AS go-builder

WORKDIR /src
COPY . .
RUN go build -o /usr/bin/retrodep

FROM registry.access.redhat.com/ubi9-minimal@sha256:7c5495d5fad59aaee12abc3cbbd2b283818ee1e814b00dbc7f25bf2d14fa4f0c

COPY --from=go-builder /usr/bin/retrodep /usr/bin/retrodep

ENTRYPOINT ["/usr/bin/retrodep"]
