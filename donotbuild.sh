#! /bin/bash
mkdir ssh
cp ~/.ssh/id_* ssh/
docker build . -t nvim
rm -rf ssh
