# amanejp-portable

A portable HTTP server (cross-platform or Docker image) embedded with all resources of ama.ne.jp.

## Cross-platform Binary

Go to [Releases](https://github.com/amane-katagiri/amanejp-portable/releases) and download binary for your platform.

```
./amanejp-portable -port 8080
```

... or double click `amanejp-portable.exe` on explorer.

## Docker Image

```
docker pull amane/amanejp
docker run --rm -p 8080:8080 amanejp
```
