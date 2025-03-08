#!/bin/bash

mkdir -p reports/dna/yogesh reports/dna/synthetic reports/single-cell/flex_procodes reports/spatial/Ratz
mkdir -p notebooks/figures

#DNA Yogesh

taskset -c '0-19' bash ./scripts/dna/yogesh/run_dna.sh

##DNA Synthetic

## simulate data
bash ./scripts/dna/synthetic/generate/simulate_dna.sh
/home/daniele/ART/art_bin_MountRainier/art_illumina -ss HSXn -i /mnt/storage/Daniele/clonal_toolkit_data/dna/synthetic/synth_1.fa -ir 0.0 -dr 0.0 -k 0 -amp -qL 20 -na -l 120 -c 2000  -o /mnt/storage/Daniele/clonal_toolkit_data/dna/synthetic/synth_1_R1
/home/daniele/ART/art_bin_MountRainier/art_illumina -ss HSXn -i /mnt/storage/Daniele/clonal_toolkit_data/dna/synthetic/synth_2.fa -ir 0.0 -dr 0.0 -k 0 -amp -qL 20 -na -l 120 -c 2000  -o /mnt/storage/Daniele/clonal_toolkit_data/dna/synthetic/synth_2_R1
/home/daniele/ART/art_bin_MountRainier/art_illumina -ss HSXn -i /mnt/storage/Daniele/clonal_toolkit_data/dna/synthetic/synth_3.fa -ir 0.0 -dr 0.0 -k 0 -amp -qL 20 -na -l 120 -c 2000  -o /mnt/storage/Daniele/clonal_toolkit_data/dna/synthetic/synth_3_R1
/home/daniele/ART/art_bin_MountRainier/art_illumina -ss HSXn -i /mnt/storage/Daniele/clonal_toolkit_data/dna/synthetic/synth_4.fa -ir 0.0 -dr 0.0 -k 0 -amp -qL 20 -na -l 120 -c 2000  -o /mnt/storage/Daniele/clonal_toolkit_data/dna/synthetic/synth_4_R1
gzip -k /mnt/storage/Daniele/clonal_toolkit_data/dna/synthetic/*.fq
mkdir -p /mnt/storage/Daniele/clonal_toolkit_data/dna/synthetic/gzipped /mnt/storage/Daniele/clonal_toolkit_data/dna/synthetic/unzipped
mv /mnt/storage/Daniele/clonal_toolkit_data/dna/synthetic/*.fq.gz /mnt/storage/Daniele/clonal_toolkit_data/dna/synthetic/gzipped
mv /mnt/storage/Daniele/clonal_toolkit_data/dna/synthetic/*.fq /mnt/storage/Daniele/clonal_toolkit_data/dna/synthetic/unzipped
for file in /mnt/storage/Daniele/clonal_toolkit_data/dna/synthetic/unzipped/*.fq; do
    mv "$file" "${file%.fq}.fastq"
done

## run pipelines
taskset -c '0-19' bash ./scripts/dna/synthetic/run_dna_synthetic.sh

#SC FLEX
taskset -c '0-19' bash ./scripts/single-cell/flex_procodes/run_sc_flex.sh

#ST RATZ
taskset -c '0-19' bash ./scripts/spatial/Ratz/run_st_Ratz.sh