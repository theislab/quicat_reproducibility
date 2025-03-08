#!/bin/bash

#### BARTAB #####
COMMAND="/home/daniele/nextflow run /home/daniele/bartab/BARtab.nf "

INPUT_FILE="/home/daniele/Code/github_synced/barcoding/quicat_paper_code/scripts/dna/yogesh/bartab_dna_yogesh_input.yaml"
LOG_FILE="/home/daniele/Code/github_synced/barcoding/quicat_paper_code/reports/dna/yogesh/bartab_dna_yogesh.log"

/usr/bin/time -v $COMMAND \
  -profile conda \
  -params-file "$INPUT_FILE" \
  -w "/mnt/storage/Daniele/quicat_benchmark/dna/yogesh/bartab/pipeline/" \
  2> "$LOG_FILE"


##### PYCASHIER #####
CONDA_ENV="cashierenv"

COMMAND1="pycashier extract -y -c"
COMMAND2="pycashier receipt -c"

INPUT_FILE="/home/daniele/Code/github_synced/barcoding/quicat_paper_code/scripts/dna/yogesh/pycashier_dna_yogesh_input.toml"
LOG_FILE="/home/daniele/Code/github_synced/barcoding/quicat_paper_code/reports/dna/yogesh/pycashier_dna_yogesh.log"

/usr/bin/time -v conda run -n $CONDA_ENV bash -c "$COMMAND1 $INPUT_FILE && $COMMAND2 $INPUT_FILE" 2> $LOG_FILE


##### quicat #####
CONDA_ENV="quicat"

COMMAND="quicat extract"

INPUT_FILE="/home/daniele/Code/github_synced/barcoding/quicat_paper_code/scripts/dna/yogesh/quicat_dna_yogesh_input.yaml"
LOG_FILE="/home/daniele/Code/github_synced/barcoding/quicat_paper_code/reports/dna/yogesh/quicat_dna_yogesh.log"

/usr/bin/time -v conda run -n "$CONDA_ENV" bash -c "$COMMAND \"$INPUT_FILE\"" 2> "$LOG_FILE"
