# gcr.io image sync

## gcr.io

- admission-server
- kube-rbac-proxy
- kube-webhook-certgen
- echoserver

## envoy

- envoy
- gateway

## others

- python-jq: python3 with jq
- python-fat: python3 with jq and curl

## pull images

`docker pull acmestack/image:tag`

## images structure

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

### nametag

eg: admission-server:v0.6.1

### push policy

- (default)skip: if image exist so skip push image, the image is not exist push it.
- override: image exist but override it.
