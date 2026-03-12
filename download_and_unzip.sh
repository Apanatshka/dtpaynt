#!/usr/bin/env bash

# Downloads the paper artifact of dtpaynt, and unzips the docker image, loads it, and
#  unpacks the benchmarks.

curl https://zenodo.org/records/15228774/files/dtpaynt.zip?download=1 -o dtpaynt.zip

unzip dtpaynt.zip
docker load -i dtpaynt/dtpaynt.tar
docker cp 420c7f2bc56e:/opt/cav25-experiments/benchmarks benchmarks
