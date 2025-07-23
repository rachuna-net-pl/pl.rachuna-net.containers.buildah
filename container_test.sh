#!/usr/bin/env bash
echo "🧪 Running smoke test: buildah --version"
buildah --version

echo $CURL_CA_BUNDLE
echo $GIT_SSL_CAINFO
echo $PIP_CERT

