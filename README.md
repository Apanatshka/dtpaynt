# Docker image

Origin: https://zenodo.org/records/15228774  
Downloaded on 2026-01-27

Download the zip, unzip it, use `docker load -i dtpaynt.tar`.

# Unpack the benchmark files

Optionally, you can unpack the benchmark files from the loaded container. You'll probably need to look up the hash for it, then you can run something like this:

```bash
docker cp 420c7f2bc56e:/opt/cav25-experiments/benchmarks benchmarks
```

# How to run

Use `run-paynt.sh`. It uses docker, expecting the dtpaynt docker image to be loaded already.
The parameters to the script are used to mount input files and output directory.

