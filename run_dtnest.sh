#!/usr/bin/env bash

# argument 1: path/to/model-file
# argument 2: path/to/props-file
# argument 3: path/to/output-directory
# argument 4: add-dont-care-action ("" or "--add-dont-care-action")

MODELNAME=$(basename -- "$1")
PROPNAME=$(basename -- "$2")
COMMAND=python3
ARGS="/opt/paynt/paynt.py /opt/paynt/models/dts-uai/ --sketch $MODELNAME --props $PROPNAME $4"

docker run --volume="$1:/opt/paynt/models/dts-uai/$MODELNAME:ro" --volume="$2:/opt/paynt/models/dts-uai/$PROPNAME:ro" --volume="$3:/opt/paynt/models/dts-uai/decision_trees/default/scheduler" dtpaynt "$COMMAND" $ARGS
