#!/usr/bin/bash

cancer=${1}
tumor_file=${2}
model_file=${3}
outpath=${4}

# location of transformed data for input into classifiers
mkdir -p ${outpath}

# Transform data into classifier space (quantile ranking)
bash scripts/quantile_ranking_wrapper.sh \
    ${cancer} \
    ${tumor_file} \
    ${model_file} \
    ${outpath}

# Get subtype classifications
mkdir -p data/classifier_gexp/ml_predictions_qrank/
bash scripts/run_gexp_models.shh ${cancer} ${outpath}

# Combine tumor and model samples into one file
mkdir -p data/classifier_gexp/ml_predictions_qrank/combo
declare -a combocohorts=('ESO' 'LUNG')
# combo cohorts
if [[ " ${combocohorts[@]} " =~ " $cancer " ]]; then   
    if [[ ${cancer} == 'ESO' ]]; then
        python scripts/multicohort_best_subtype.py \
        --cancer ESO \
        -f1 data/classifier_gexp/ml_predictions_qrank/hcmi_ESCC_Tumor.QRANK/HCMI_GEXP_TMPsubtypes.ESCC.Tumor.tsv \
        -f2 data/classifier_gexp/ml_predictions_qrank/hcmi_GEA_Tumor.QRANK/HCMI_GEXP_TMPsubtypes.GEA.Tumor.tsv \
        --outfile data/classifier_gexp/ml_predictions_qrank/combo/HCMI_TMPsubtype_qRank_ESO_Tumor.tsv

        python scripts/multicohort_best_subtype.py \
        --cancer ESO \
        -f1 data/classifier_gexp/ml_predictions_qrank/hcmi_ESCC_Model.QRANK/HCMI_GEXP_TMPsubtypes.ESCC.Model.tsv \
        -f2 data/classifier_gexp/ml_predictions_qrank/hcmi_GEA_Model.QRANK/HCMI_GEXP_TMPsubtypes.GEA.Model.tsv \
        --outfile data/classifier_gexp/ml_predictions_qrank/combo/HCMI_TMPsubtype_qRank_ESO_Model.tsv

        python scripts/tumor_model_merge.py \
        --cohort ESO \
        --outfile data/classifier_gexp/ml_predictions_qrank/combo/HCMI_TMPsubtype_qRank_ESO.tsv


    elif [[ ${cancer} == 'LUNG' ]]; then
        python scripts/multicohort_best_subtype.py \
        --cancer LUNG \
        -f1 data/classifier_gexp/ml_predictions_qrank/hcmi_LUAD_Tumor.QRANK/HCMI_GEXP_TMPsubtypes.LUAD.Tumor.tsv \
        -f2 data/classifier_gexp/ml_predictions_qrank/hcmi_LUSC_Tumor.QRANK/HCMI_GEXP_TMPsubtypes.LUSC.Tumor.tsv \
        --outfile data/classifier_gexp/ml_predictions_qrank/combo/HCMI_TMPsubtype_qRank_LUNG_Tumor.tsv

        python scripts/multicohort_best_subtype.py \
        --cancer LUNG \
        -f1 data/classifier_gexp/ml_predictions_qrank/hcmi_LUAD_Model.QRANK/HCMI_GEXP_TMPsubtypes.LUAD.Model.tsv \
        -f2 data/classifier_gexp/ml_predictions_qrank/hcmi_LUSC_Model.QRANK/HCMI_GEXP_TMPsubtypes.LUSC.Model.tsv \
        --outfile data/classifier_gexp/ml_predictions_qrank/combo/HCMI_TMPsubtype_qRank_LUNG_Model.tsv

        python scripts/tumor_model_merge.py \
        --cohort LUNG \
        --outfile data/classifier_gexp/ml_predictions_qrank/combo/HCMI_TMPsubtype_qRank_LUNG.tsv
    fi
# single cohorts
else
    python scripts/results_combine.py \
    -c ${cancer} \
    -in1 data/classifier_gexp/ml_predictions_qrank/hcmi_${cancer}_Tumor.QRANK/HCMI_GEXP_TMPsubtypes.${cancer}.Tumor.tsv \
    -in2 data/classifier_gexp/ml_predictions_qrank/hcmi_${cancer}_Model.QRANK/HCMI_GEXP_TMPsubtypes.${cancer}.Model.tsv \
    -out data/classifier_gexp/ml_predictions_qrank/combo/HCMI_TMPsubtype_qRank_${cancer}.tsv
fi

# Run modifications incorporated in this script
# + COADREAD Tumor/Model: no AKLIMATE/JADBio
# + PAAD GEXP for AKLIMATE, but can use MULTI since uses only GEXP fts
# + LGGGBM Tumor/Model: no JADBio/SKGrid/AKLIMATE
# + ESO Tumor/Model: no JADBio