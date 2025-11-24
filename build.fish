#!/usr/bin/env fish

podman build -t zmk-build-arm-custom:latest . || return;
podman run --rm -it -v .:/workdir:Z zmk-build-arm-custom:latest
