#!/bin/bash

##### BARTAB #####
#COMMAND="/home/daniele/nextflow run /home/daniele/bartab/BARtab.nf "
#
#INPUT_FILE="/home/daniele/Code/github_synced/barcoding/quicat_paper_code/scripts/dna/synthetic/bartab_dna_synthetic_input.yaml"
#LOG_FILE="/home/daniele/Code/github_synced/barcoding/quicat_paper_code/reports/dna/synthetic/bartab_dna_synthetic.log"
#
#/usr/bin/time -v $COMMAND \
#    -profile conda \
#    -params-file "$INPUT_FILE" \
#    -w "/mnt/storage/Daniele/quicat_benchmark/dna/synthetic/bartab/pipeline" \
#    2> "$LOG_FILE"

###### PYCASHIER #####
CONDA_ENV="cashierenv"

COMMAND1="pycashier extract -y -c"
COMMAND2="pycashier receipt -c"

INPUT_FILE="/home/daniele/Code/github_synced/barcoding/quicat_paper_code/scripts/dna/synthetic/pycashier_dna_synthetic_input.toml"
LOG_FILE="/home/daniele/Code/github_synced/barcoding/quicat_paper_code/reports/dna/synthetic/pycashier_dna_synthetic.log"

/usr/bin/time -v conda run -n $CONDA_ENV bash -c "$COMMAND1 $INPUT_FILE && $COMMAND2 $INPUT_FILE" 2> $LOG_FILE

###### quicat #####
#CONDA_ENV="quicat"
#
#COMMAND="quicat extract"
#
#INPUT_FILE="/home/daniele/Code/github_synced/barcoding/quicat_paper_code/scripts/dna/synthetic/quicat_dna_synthetic_input.yaml"
#LOG_FILE="/home/daniele/Code/github_synced/barcoding/quicat_paper_code/reports/dna/synthetic/quicat_dna_synthetic.log"
#
#/usr/bin/time -v conda run -n "$CONDA_ENV" bash -c "$COMMAND \"$INPUT_FILE\"" 2> "$LOG_FILE"
