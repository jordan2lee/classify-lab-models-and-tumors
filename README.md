<h1 align="center">Subtype Classification of Tumors and Derived Lab Grown Models</h1>
<h4 align="center">Molecular subtyping using the TMP Toolkit</h4>


## Table of contents
- [Quickstart Guide](#quickstart-guide)
- [Download Data from Manifest File Using the GDC Client](#download-data-from-manifest-file-using-the-gdc-client)
- [Run Processing Pipeline](#run-processing-pipeline)
- [Sample Subtype Classification using Gene Expression Data](#sample-subtype-classification-using-gene-expression-data)
- [Sample Subtype Classification using DNA Methylation Data](#sample-subtype-classification-using-dna-methylation-data)

## Quickstart Guide

### Setup

Install requirements - detailed instructions are found on the [Requirements page](doc/requirements.md):

1. Install Python 3+
2. Install GDC Data Transfer Tool Client

Ensure that steps are completed on the [Requirements page](doc/requirements.md) - *(includes creating working environment, signining in, and manually downloading required data)*

## Download Data from Manifest File Using the GDC Client
Download Gene Expression Data
```bash
bash scripts/gdc_download.sh PAAD
```

This will create subfolders in `dat`a-raw/<CANCER>_GEXP_<TYPE>` and place GDC molecular matrices here.

> Options for cancer cohort includes `ALL`, `BLCA`, `BRCA`, `COADREAD`, `ESO`, `HNSC`, `KID`, `LGGGBM`, `LIHCCHOL`, `LUNG`, `OV`, `PAAD`, `SARC`, `SKCM`, `UCEC`

For more details on each cancer cohort option see [Cohort Options Page](doc/cohort_options.md)


## Run Processing Pipeline
Example shown for running PAAD cohort
```bash
bash scripts/process.sh PAAD data/prep
```

> Creates file `data/prep/<CANCER>_GEXP/<CANCER>_GEXP_prep2_<TYPE>.tsv` that is prepped for distance calculations

> Options for cancer cohort includes `ALL`, `BLCA`, `BRCA`, `COADREAD`, `ESO`, `HNSC`, `KID`, `LGGGBM`, `LIHCCHOL`, `LUNG`, `OV`, `PAAD`, `SARC`, `SKCM`, `UCEC`

For more details on each cancer cohort option see [Cohort Options Page](doc/cohort_options.md)

## Sample Subtype Classification Using Gene Expression Data
The goal of this analysis is to get cancer subtype predictions for HCMI samples (organoids, cell cultures , xenografts, etc). To accomplish this we will use the top performing pre-trained machine learning models (dockerized TMP models that were trained using TCGA data that has been pre-proccessed). Specifically we are interested in using gene expression from the HCMI samples and eventually compare primary tumors to their corresponding models (organoids, cell cultures , xenografts, etc).

The TMP models (pre-trained models) are specific to TCGA cancer cohorts (TCGA abbreviations), therefore we will split HCMI data into TCGA cancer cohorts(based on sample metadata).

Run gene expression classifier pipeline:
```bash
# where specify cancer, tumor-file, model-file, transformed-dir
bash scripts/run_classify_GEXP.sh \
    PAAD \
    data/prep/PAAD_GEXP/PAAD_GEXP_prep2_Tumor.tsv \
    data/prep/PAAD_GEXP/PAAD_GEXP_prep2_Model.tsv \
    data/classifier_gexp/ml_ready_qrank
```

Results can found in `data/classifier_gexp/ml_predictions_qrank/combo/HCMI_TMPsubtype_qRank_<CANCER>.tsv `

*Note: LUNG (includes LUAD and LUSC), ESO (includes GEA and ESCC) during transformation and classification, then is merged in post-classification summary*


## Sample Subtype Classification Using DNA Methylation Data
The goal of this analysis is to get cancer subtype predictions for HCMI samples (organoids, cell cultures , xenografts, etc). To accomplish this we will use the top performing pre-trained machine learning models (dockerized TMP models that were trained using TCGA data that has been pre-proccessed). Specifically we are interested in using gene expression from the HCMI samples and eventually compare primary tumors to their corresponding models (organoids, cell cultures , xenografts, etc).

The TMP models (pre-trained models) are specific to TCGA cancer cohorts (TCGA abbreviations), therefore we will split HCMI data into TCGA cancer cohorts(based on sample metadata).

Run DNA methylation classifier pipeline:
```bash
# where specify cancer, tumor-file, model-file, transformed-dir
bash scripts/run_classify_METHYL.sh \
    SKCM \
    data/classifier_methyl/processed/20231211_HCMI_TMP_subtype_prediction_feature_matrix_SKCM.tsv
```

Results can found in `data/classifier_methyl/ml_predictions/combo/HCMI_METH_TMPsubtypes.<CANCER>.tsv`

*Note: LUNG (includes LUAD and LUSC), ESO (includes GEA and ESCC) during transformation and classification, then is merged in post-classification summary*

> *Second Example for Combination Cohort*
> ```bash
> bash scripts/run_classify_METHYL.sh \
>     LUNG \
>     data/classifier_methyl/processed/20231211_HCMI_TMP_subtype_prediction_feature_matrix_LUNG.tsv
> ```