#!/bin/bash

cat <<EOF> /etc/docker/daemon.json
{
    "registry-mirrors": [
        "https://docker.hlmirror.com",
        "https://docker-0.unsee.tech",
        "https://docker.tbedu.top"
    ],
    "data-root": "/data1/docker"
}
EOF
