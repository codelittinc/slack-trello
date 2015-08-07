#!/bin/bash

set -e

cp Dockerfile.production Dockerfile
docker build -t codelittinc/slack-trello .
rm Dockerfile
docker push codelittinc/slack-trello:latest

#Pipe commands from this file into the server
#Example of the contents of this file are in prod_server.sh.example
cat prod_server.sh | ssh@SERVER_IP

