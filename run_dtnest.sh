#!/usr/bin/env bash

# argument 1: path/to/model-file
# argument 2: path/to/props-file
# argument 3: path/to/state-valuations-file
# argument 4: path/to/default-scheduler-file
# argument 5: path/to/output-directory
# argument 6: add-dont-care-action ("" or "--add-dont-care-action")

MODELNAME=$(basename -- "$1")
PROPNAME=$(basename -- "$2")
# Command to execute dtNESt
DTNEST="python3 /opt/paynt/paynt.py /opt/paynt/models/dts-uai/ --sketch $MODELNAME --props $PROPNAME $6"
# Editing the decision tree file directly as there is no other way to get the code to actually output the learned tree...
SET_OUTPUT_NAME="sed -i '35i\\"$'\n'"        self.export_synthesis_filename_base = \"/opt/paynt/models/dts-uai/results/tree\""$'\n'"' /opt/paynt/paynt/synthesizer/decision_tree.py"

docker run --volume="$1:/opt/paynt/models/dts-uai/$MODELNAME:ro" --volume="$2:/opt/paynt/models/dts-uai/$PROPNAME:ro" --volume="$3:/opt/paynt/models/dts-uai/state-valuations.json:ro" --volume="$4:/opt/paynt/models/dts-uai/decision_trees/default/scheduler:ro" --volume="$5:/opt/paynt/models/dts-uai/results" paynt:uai sh -c "$SET_OUTPUT_NAME; $DTNEST"
