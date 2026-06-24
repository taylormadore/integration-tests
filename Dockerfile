FROM mirror.gcr.io/golang:1.26.4-alpine

# Test disabled network access
RUN if getent hosts www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /src
COPY . .
RUN go build -o /usr/bin/retrodep

CMD retrodep --help
