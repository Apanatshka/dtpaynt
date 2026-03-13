#!/usr/bin/env bash

# Downloads the paper artifact of dtpaynt, and unzips the docker image, loads it, and
#  unpacks the benchmarks.

curl https://zenodo.org/records/15228774/files/dtpaynt.zip?download=1 -o dtpaynt.zip

unzip dtpaynt.zip -d dtpaynt
docker load -i dtpaynt/dtpaynt.tar
CONTAINER_ID=$(docker create dtpaynt:latest)
docker cp "$CONTAINER_ID:/opt/cav25-experiments/benchmarks" benchmarks


# Now let's do the same for dtnest

curl https://zenodo.org/records/15642002/files/uai-dts-25.tar?download=1 -o dtnest.tar

docker load -i dtnest.tar
CONTAINER_ID=$(docker create paynt:uai)
docker cp "$CONTAINER_ID:/opt/paynt/models/dts-uai" dtnest-benchmarks
