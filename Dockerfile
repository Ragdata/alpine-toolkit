FROM alpine:3.18.3

# renovate: datasource=repology depName=alpine_3_18/bash versioning=loose
ARG BASH_VERSION=5.2.15-r5

# renovate: datasource=repology depName=alpine_3_18/curl versioning=loose
ARG CURL_VERSION=8.2.1-r0

# renovate: datasource=github-releases depName=mikefarah/yq extractVersion=^v(?<version>.*)$
ARG YQ_VERSION=4.31.2

# renovate: datasource=repology depName=alpine_3_18/jq versioning=loose
ARG JQ_VERSION=1.6-r3

# renovate: datasource=repology depName=alpine_3_18/tzdata versioning=loose
ARG TZDATA_VERSION=2023c-r1

# renovate: datasource=repology depName=alpine_3_18/coreutils versioning=loose
ARG COREUTILS_VERSION=9.3-r1

# renovate: datasource=repology depName=alpine_3_18/gettext
ARG GETTEXT_VERSION=0.21.1-r7

# renovate: datasource=repology depName=alpine_3_18/openssl
ARG OPENSSL_VERSION=3.1.2-r0

# renovate: datasource=repology depName=alpine_3_18/net-tools
ARG NET_TOOLS_VERSION=1.60

RUN apk add --no-cache \
  bash==${BASH_VERSION} \
  curl==${CURL_VERSION} \
  jq==${JQ_VERSION} \
  tzdata==${TZDATA_VERSION} \
  coreutils==${COREUTILS_VERSION} \
  gettext==${GETTEXT_VERSION} \
  openssl==${OPENSSL_VERSION} \
  net-tools==${NET_TOOLS_VERSION} \
  && rm -rf /var/cache/apk/*

RUN wget -O /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/yq_linux_amd64 && \
  chmod +x /usr/local/bin/yq
