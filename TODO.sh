#!/bin/bash
set -euo pipefail

if [ "$(docker ps -a --filter 'name=TODO' -q)" ]; then
    docker stop TODO
    docker rm TODO
fi

cd getting-started-master/getting-started-master/app

docker build -t getting-started .
docker run -dp 3000:3000 --name TODO getting-started