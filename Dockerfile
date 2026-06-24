FROM mirror.gcr.io/node:22.23.1-alpine

# Test disabled network access
RUN if getent hosts www.google.com; then echo "Has network access!"; exit 1; fi

# Install pnpm from generic backend artifact
RUN npm install -g /cachi2/output/deps/generic/pnpm-10.34.3.tgz

WORKDIR /src
RUN pnpm install
