#!/bin/bash

CONDA_ENV="quicat"
COMMAND="quicat simulate"
INPUT_FILE="/home/daniele/Code/github_synced/barcoding/quicat_paper_code/scripts/dna/synthetic/generate/simulate_dna_conf.yaml"
LOG_FILE="/home/daniele/Code/github_synced/barcoding/quicat_paper_code/reports/dna/synthetic/generate/generate.log"

/usr/bin/time -v conda run -n "$CONDA_ENV" bash -c "$COMMAND \"$INPUT_FILE\"" 2> "$LOG_FILE"
