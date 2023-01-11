FROM envoyproxy/envoy:v1.24-latest

COPY sources.list /etc/apt/
RUN apt-get update && apt-get install -y \
curl
