# quicat_reproducibility

Repository for quicat benchmarking

## Project Organization

    ├── LICENSE
    │ 
    ├── README.md          <- The top-level README.
    │ 
    ├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
    │                         and a short `_` delimited description.
    │ 
    ├── scripts            <- Additional scripts used for the analysis.
    │ 
    └── environment_{package_name}.yml    <- The requirements file for reproducing the analysis with each package.

---

## How to reproduce the analysis

1. Create the 3 conda environment for quiCAT, pycashier, and bartab using the `yml` files in the root directory
   1. For bartab it is also necessary to install NextFlow and pull their pipeline. Follow [their installation manual](https://github.com/DaneVass/BARtab).
   2. For the simulator you would need to install [ART](https://www.niehs.nih.gov/research/resources/software/biostatistics/art)
2. In the scripts folder update the yaml and csv files to reflect the file paths where you stored the data.
   1. dna:
      1. synthetic contains the config file to simulate synthetic dna barcodes and run the three pipelines afterwards
      2. yogesh is to run the analyses on [the publicly available DNA dataset](https://pubmed.ncbi.nlm.nih.gov/37468627/).
   2. single-cell/flex-procodes is to run analyses on our newly generated dataset leveraging procodes and single cell for clonal tracking.
   3. spatial/trex is to run analyses on [the publicly available Visium dataset](https://www.nature.com/articles/s41593-022-01011-x)
3. After modifying inputs to point to your storage locations, run the whole analysis with `.bash run_everything.sh` from the root directory. Alternatively you can run them separately by running the bash script in each folder.
4. Head on to notebooks folder and create an environment with `notebooks/notebooks_environment.yml`
5. Run the notebooks in order to reproduce the results.
