#!/usr/bin/bash

cancer=${1}
file=${2}

# Transpose
if [[ ${cancer} == 'KIRCKICH' ]]; then
    outfile=${file/'.tsv'/'_tr.tsv'}
    outfile="${outfile##*/}"
    outfile=${outfile/'KID'/'KIRCKICH'}
    python scripts/transpose_matrix.py --tsv_file ${file} --output_file data/classifier_methyl/ml_ready/${outfile}
else
    outfile=${file/'.tsv'/'_tr.tsv'} 
    outfile="${outfile##*/}"
    python scripts/transpose_matrix.py --tsv_file ${file} --output_file data/classifier_methyl/ml_ready/${outfile}
fi

# Get subtype classifications
bash scripts/run_methyl_models.sh ${cancer} data/classifier_methyl/ml_ready/${outfile}

# Combine tumor and model samples into one file
declare -a combocohorts=('ESO' 'LUNG')
# combo cohorts
if [[ " ${combocohorts[@]} " =~ " $cancer " ]]; then   
    if [[ ${cancer} == 'LUNG' ]]; then
        python scripts/multicohort_best_subtype.py \
        --cancer LUNG \
        -f1 data/classifier_methyl/ml_predictions/hcmi_LUSC_methyl/HCMI_METH_TMPsubtypes.LUSC.tsv \
        -f2 data/classifier_methyl/ml_predictions/hcmi_LUAD_methyl/HCMI_METH_TMPsubtypes.LUAD.tsv \
        --outfile data/classifier_methyl/ml_predictions/combo/HCMI_METH_TMPsubtypes.LUNG.tsv
    elif [[ ${cancer} == 'ESO' ]]; then
        python scripts/multicohort_best_subtype.py \
        --cancer ESO \
        -f1 data/classifier_methyl/ml_predictions/hcmi_LUSC_methyl/HCMI_METH_TMPsubtypes.GEA.tsv \
        -f2 data/classifier_methyl/ml_predictions/hcmi_LUAD_methyl/HCMI_METH_TMPsubtypes.ESCC.tsv \
        --outfile data/classifier_methyl/ml_predictions/combo/HCMI_METH_TMPsubtypes.ESO.tsv
    fi
# single cohorts
else
    cp data/classifier_methyl/ml_predictions/hcmi_${cancer}_methyl/HCMI_METH_TMPsubtypes.${cancer}.tsv data/classifier_methyl/ml_predictions/combo
fi
