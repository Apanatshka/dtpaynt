#!/usr/bin/env bash

# argument 1: path/to/model-file
# argument 2: path/to/props-file
# argument 3: add-dont-care-action ("" or "--add-dont-care-action")
# argument 4: subtree_depth (integer, default 7)
# argument 5: timeout (integer, seconds, default 1200)

MODELNAME=$(basename -- "$1")
PROPNAME=$(basename -- "$2")
COMMAND=python3
ARGS="/opt/paynt/paynt.py /opt/paynt/models/dts-uai/ --sketch $MODELNAME --props $PROPNAME $3 --subtree-depth $4 --timeout $5 --export-synthesis /opt/paynt/models/results/tree"

docker run --volume="$1:/opt/paynt/models/dts-uai/$MODELNAME:ro" --volume="$2:/opt/paynt/models/dts-uai/$PROPNAME:ro" dtpaynt "$COMMAND" $ARGS
