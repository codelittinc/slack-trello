#! /bin/bash

set -e

cp Dockerfile.development Dockerfile
docker build -t codelittinc/slack-trello .
rm Dockerfile

docker run \
  -ti \
  --name slack-trello-ruby \
  -v $(pwd):/share \
  -p 3000:3000 codelittinc/slack-trello /bin/bash -l

echo -e "Next steps:\n"
echo -e "\t1. Bundle install"
