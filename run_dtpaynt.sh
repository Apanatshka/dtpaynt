#!/usr/bin/env bash

# argument 1: path/to/model-file
# argument 2: path/to/props-file
# argument 3: path/to/state-valuations-file
# argument 4: path/to/output-directory
# argument 5: tree depth
# argument 6: timeout

MODELNAME=$(basename -- "$1")
PROPNAME=$(basename -- "$2")
COMMAND=python3
ARGS="/opt/paynt/paynt.py /opt/cav25-experiments/benchmarks/ --sketch $MODELNAME --props $PROPNAME --tree-enumeration --tree-depth=$5 --timeout $6 --export-synthesis /opt/cav25-experiments/results/tree"

docker run --volume="$1:/opt/cav25-experiments/benchmarks/$MODELNAME:ro" --volume="$2:/opt/cav25-experiments/benchmarks/$PROPNAME:ro" --volume="$3:/opt/cav25-experiments/benchmarks/state-valuations.json:ro" --volume="$4:/opt/cav25-experiments/results" dtpaynt "$COMMAND" $ARGS
