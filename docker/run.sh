#!/bin/sh

IMAGE=${IMAGE:-openvino-speechstamp:latest}


(
    docker run \
        --rm \
        --user "$UID:$(id -g)" \
        -it \
        -v $PWD:/opt/src \
        $IMAGE
)
