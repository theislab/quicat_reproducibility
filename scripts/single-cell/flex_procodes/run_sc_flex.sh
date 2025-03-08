#!/bin/bash

##### quicat #####
CONDA_ENV="quicat"

COMMAND="quicat extract"

INPUT_FILE="/home/daniele/Code/github_synced/barcoding/quicat_paper_code/scripts/single-cell/flex_procodes/quicat_sc_flex_input_bam.yaml"
LOG_FILE="/home/daniele/Code/github_synced/barcoding/quicat_paper_code/reports/single-cell/flex/quicat_sc_flex_bam.log"

/usr/bin/time -v conda run -n "$CONDA_ENV" bash -c "$COMMAND \"$INPUT_FILE\"" 2> "$LOG_FILE"


##### BARTAB #####
COMMAND="/home/daniele/nextflow run /home/daniele/bartab/BARtab.nf "

INPUT_FILE="/home/daniele/Code/github_synced/barcoding/quicat_paper_code/scripts/single-cell/flex_procodes/bartab_sc_flex_input_bam.yaml"
LOG_FILE="/home/daniele/Code/github_synced/barcoding/quicat_paper_code/reports/single-cell/flex/bartab_sc_flex_bam.log"

/usr/bin/time -v $COMMAND \
  -profile conda \
  -params-file "$INPUT_FILE" \
  -w "/mnt/storage/Daniele/quicat_benchmark/dna/yogesh/bartab/pipeline/" \
  2> "$LOG_FILE"