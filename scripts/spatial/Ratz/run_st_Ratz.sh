#!/bin/bash


CONDA_ENV="quicat"

COMMAND="quicat extract"

INPUT_FILE="/home/daniele/Code/github_synced/barcoding/quicat_paper_code/scripts/spatial/Ratz/quicat_st_Ratz_input_bam.yaml"
LOG_FILE="/home/daniele/Code/github_synced/barcoding/quicat_paper_code/reports/spatial/Ratz/quicat_st_Ratz_bam.log"

/usr/bin/time -v conda run -n "$CONDA_ENV" bash -c "$COMMAND \"$INPUT_FILE\"" 2> "$LOG_FILE"