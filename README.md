# gcr.io image sync

## images sync introduction

### image nametag

eg: admission-server:v0.6.1

### image push policy

- (default)skip: If the image already exists skip it, otherwise push it.
- override: image exist but override it.

### images directory

```bash
├── images
│   ├── admission-server
│   │   ├── Dockerfile
│   │   └── nametag
│   ├── kube-rbac-proxy
│   │   ├── Dockerfile
│   │   └── nametag
│   └── kube-webhook-certgen
│       ├── Dockerfile
│       ├── nametag
│       └── policy
```

## images

### gcr.io

- admission-server
- kube-rbac-proxy
- kube-webhook-certgen
- echoserver

### envoyproxy

- envoy
- gateway

### others

- python-jq: python3 with jq
- python-fat: python3 with jq and curl

## pull images

`docker pull acmestack/nametag`
