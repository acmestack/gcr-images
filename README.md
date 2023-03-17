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
│   │   ├── name
│   │   └── tag
│   ├── kube-rbac-proxy
│   │   ├── Dockerfile
│   │   ├── name
│   │   └── tag
│   └── kube-webhook-certgen
│       ├── Dockerfile
│       ├── name
│       └── tag
```

### push policy

- (default)skip: if image exist so skip push image, the image is not exist push it.
- override: image exist but override it.
