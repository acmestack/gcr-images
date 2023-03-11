# gcr.io image sync

- admission-server
- kube-rbac-proxy
- kube-webhook-certgen
- echoserver

# others

- python-jq: python3 with jq
- python-fat: python3 with jq and curl

# envoy

- envoy
- gateway

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
