# Hagrid OCI image

![pipeline status](https://github.com/chimbosonic/hagrid-container/actions/workflows/main.yml/badge.svg?branch=main)

This is a Hagrid OCI image built using https://gitlab.com/hagrid-keyserver/hagrid.

Base image is `rust:slim`.

The image is available on Docker Hub [here](https://hub.docker.com/repository/docker/chimbosonic/hagrid)

Source code and pipeline can be found [here](https://github.com/chimbosonic/hagrid-container)

## Image Verification

The image is signed using [cosign](https://github.com/sigstore/cosign) from sigstore.

You can verify the signature with:

```bash
cosign verify --key cosign.pub chimbosonic/hagrid:latest
```

## Running it

### plain docker

```bash
docker run --rm -it -p 8080:8080\
	-v $(shell pwd)/data:/var/lib/hagrid\
	chimbosonic/hagrid:latest
```

### How to build

This will build the container.

```bash
make build
```

On first run it will poplate the data folder with the default distribution files I recommend editing them.

The Rocket.toml contains the config of hagrid and should also be changed accordingly.

All credit goes to the maintainers of [Hagrid](https://gitlab.com/hagrid-keyserver/hagrid)
