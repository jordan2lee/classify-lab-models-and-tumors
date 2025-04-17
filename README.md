<h1 align="center">Subtype Classification of Tumors and Derived Lab Grown Models</h1>
<h4 align="center">Molecular subtyping using the TMP Toolkit</h4>


## Table of contents
- [Quickstart Guide](#quickstart-guide)
- [Download Source Files](#download-source-files)
- [Download Data from Manifest File Using the GDC Client](#download-data-from-manifest-file-using-the-gdc-client)
- [Run Processing Pipeline](#run-processing-pipeline)
- [Sample Subtype Classification using Gene Expression Data](#sample-subtype-classification-using-gene-expression-data)


## Quickstart Guide

### Setup

Install requirements - detailed instructions are found on the [Requirements page](doc/requirements.md):

1. Install Python 3+
2. Install Docker Desktop (or Docker)
4. Install GDC Data Transfer Tool Client

Ensure that steps are completed on the [Requirements page](doc/requirements.md) - *(includes creating working environment, signining in, and manually downloading required data)*

## Download Source Files

This will show how to get the files to download files from the GDC data portal by using a manifest file

### Download Manifest Files

Download manifest files for all samples and place in `src/gdc_download_ref/`. TODO add location to download these files.

> Manifest names follow the pattern: `gdc_manifest.<CANCER>_<DATAPLATFORM>_<TYPE>.txt`

### Download Sample Sheets

Download manifest files for all samples and place in `src/gdc_download_ref/`. TODO add location to download these files.

> Sample sheet names follow the pattern: `gdc_sample_sheet.<CANCER>_<DATAPLATFORM>_<TYPE>.tsv`

## Download Data from Manifest File Using the GDC Client
Download Gene Expression Data
```bash
bash scripts/gdc_download.sh
```

This will create subfolders in `data-raw/<CANCER>_GEXP_<TYPE>` and place GDC molecular matrices here.

> *Note on the selection of Cancer Type: These HCMI selections of Cancer Type were made and grouped together for each corresponding TCGA cancer cohort:*
>
> + 'BLCA':['Bladder Cancer']
> + 'BRCA':['Breast Cancer','Intraductal Carcinoma']
> + 'COADREAD': ['Colorectal Cancer', 'Rare Cancer','Serrated Adenoma','Tubular Adenoma','Tubulovilluos Adenoma']
> + 'ESO': ['Esophageal Cancer','Stomach Cancer']
> + 'HNSC':['Head and Neck']
> + 'KID':['Kidney Cancer']
> + 'LGGGBM':['Glioblastoma']
> + 'LIHCCHOL':['Extrahepatic Cholangiocarcinoma','Ampulla of Vater','Hepatocellular carcinoma','Intrahepatic Cholangiocarcinoma']
> + 'LUNG':['Lung Cancer']
> + 'OV':['Ovarian Cancer']
> + 'PAAD': ['Pancreatic Cancer']
> + 'SARC': ['Bone Cancer','Clear Cell Sarcoma','Desmoid Tumors','Epithelial Sarcoma','Ewing Sarcoma','Intimal Sarcoma','Leiomyosarcoma','Rhabdomyosarcoma','Spindle Cell Sarcoma','Undifferentiated Pleomorphic Sarcoma']
> + 'SKCM':['Melanoma']
> + 'UCEC':['Endometrial Cancer'],


## Run Processing Pipeline
Example shown for running PAAD cohort
```bash
bash scripts/process.sh PAAD data/prep
```

> Creates file `data/prep/<CANCER>_GEXP/<CANCER>_GEXP_prep2_<TYPE>.tsv` that is prepped for distance calculations

## Sample Subtype Classification Using Gene Expression Data
The goal of this analysis is to get cancer subtype predictions for HCMI samples (organoids, cell cultures , xenografts, etc). To accomplish this we will use the top performing pre-trained machine learning models (dockerized TMP models that were trained using TCGA data that has been pre-proccessed). Specifically we are interested in using gene expression from the HCMI samples and eventually compare primary tumors to their corresponding models (organoids, cell cultures , xenografts, etc).

The TMP models (pre-trained models) are specific to TCGA cancer cohorts (TCGA abbreviations), therefore we will split HCMI data into TCGA cancer cohorts(based on sample metadata).

Results can found in `data/classifier_gexp/ml_predictions_qrank/combo/HCMI_TMPsubtype_qRank_<CANCER>.tsv `


Run classifier pipeline:
```bash
# where specify cancer, tumor-file, model-file, transformed-dir
bash scripts/run_classify.sh \
    PAAD \
    data/prep/PAAD_GEXP/PAAD_GEXP_prep2_Tumor.tsv \
    data/prep/PAAD_GEXP/PAAD_GEXP_prep2_Model.tsv \
    data/classifier_gexp/ml_ready_qrank
```

*Note: LUNG (includes LUAD and LUSC), ESO (includes GEA and ESCC) during transformation and classification, then is merged in post-classification summary*

> *Second Example for Combination Cohort*
> ```bash
> bash scripts/run_classify.sh \
>     LUNG \
>     data/prep/LUNG_GEXP/LUNG_GEXP_prep2_Tumor.tsv \
>     data/prep/LUNG_GEXP/LUNG_GEXP_prep2_Model.tsv \
>     data/classifier_gexp/ml_ready_qrank 
> ```
