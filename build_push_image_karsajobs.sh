#!/bin/bash

# build image dengan tag sesuai docker hub
docker build -t ghcr.io/mfdsix/karsajobs:latest .

# login ke image registry
echo GITHUB_PERSONAL_ACCESS_TOKEN | docker login ghcr.io -u mfdsix --password-stdin

# push image ke registry
docker push ghcr.io/mfdsix/karsajobs:latest