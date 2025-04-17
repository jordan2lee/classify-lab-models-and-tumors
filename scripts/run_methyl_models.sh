#!/usr/bin/env python

cancer=${1}
file=${2}

cd gdan-tmp-models 
if [[ ${cancer} == 'BLCA' ]]; then
    bash RUN_MODEL.sh ${cancer} METH cloudforest ../${file}
    bash RUN_MODEL.sh ${cancer} METH jadbio ../${file}
    bash RUN_MODEL.sh ${cancer} METH subscope ../${file}
    bash tools/migrate.sh ${cancer} METH hcmi_${cancer}_methyl
    bash tools/build_results_file.sh HCMI_METH_TMPsubtypes.${cancer}.tsv hcmi_${cancer}_methyl ${cancer} METH cloudforest.jadbio.subscope

elif [[ ${cancer} == 'BRCA' ]]; then
    bash RUN_MODEL.sh ${cancer} METH cloudforest ../${file}
    bash RUN_MODEL.sh ${cancer} METH jadbio ../${file}
    bash RUN_MODEL.sh ${cancer} METH subscope ../${file}
    bash tools/migrate.sh ${cancer} METH hcmi_${cancer}_methyl
    bash tools/build_results_file.sh HCMI_METH_TMPsubtypes.${cancer}.tsv hcmi_${cancer}_methyl ${cancer} METH cloudforest.jadbio.subscope

elif [[ ${cancer} == 'COADREAD' ]]; then
    bash RUN_MODEL.sh ${cancer} METH skgrid ../${file}
    bash RUN_MODEL.sh ${cancer} METH aklimate ../${file}
    bash RUN_MODEL.sh ${cancer} METH cloudforest ../${file}
    bash RUN_MODEL.sh ${cancer} METH jadbio ../${file}
    bash RUN_MODEL.sh ${cancer} METH subscope ../${file}
    bash tools/migrate.sh ${cancer} METH hcmi_${cancer}_methyl
    bash tools/build_results_file.sh HCMI_METH_TMPsubtypes.${cancer}.tsv hcmi_${cancer}_methyl ${cancer} METH skgrid.aklimate.cloudforest.jadbio.subscope

elif [[ ${cancer} == 'ESO' ]]; then
    modified_cancer='ESCC'
    bash RUN_MODEL.sh ${modified_cancer} METH skgrid ../${file}
    bash RUN_MODEL.sh ${modified_cancer} METH aklimate ../${file}
    bash RUN_MODEL.sh ${modified_cancer} METH cloudforest ../${file}
    bash RUN_MODEL.sh ${modified_cancer} METH jadbio ../${file}
    bash RUN_MODEL.sh ${modified_cancer} METH subscope ../${file}
    bash tools/migrate.sh ${modified_cancer} METH hcmi_${modified_cancer}_methyl
    bash tools/build_results_file.sh HCMI_METH_TMPsubtypes.${modified_cancer}.tsv hcmi_${modified_cancer}_methyl ${modified_cancer} METH skgrid.aklimate.cloudforest.jadbio.subscope
    modified_cancer='GEA'
    bash RUN_MODEL.sh ${modified_cancer} METH skgrid ../${file}
    bash RUN_MODEL.sh ${modified_cancer} METH aklimate ../${file}
    bash RUN_MODEL.sh ${modified_cancer} METH cloudforest ../${file}
    bash RUN_MODEL.sh ${modified_cancer} METH jadbio ../${file}
    bash RUN_MODEL.sh ${modified_cancer} METH subscope ../${file}
    bash tools/migrate.sh ${modified_cancer} METH hcmi_${modified_cancer}_methyl
    bash tools/build_results_file.sh HCMI_METH_TMPsubtypes.${modified_cancer}.tsv hcmi_${modified_cancer}_methyl ${modified_cancer} METH skgrid.aklimate.cloudforest.jadbio.subscope

elif [[ ${cancer} == 'HNSC' ]]; then
    bash RUN_MODEL.sh ${cancer} METH cloudforest ../${file}
    bash RUN_MODEL.sh ${cancer} METH jadbio ../${file}
    bash RUN_MODEL.sh ${cancer} METH subscope ../${file}
    bash tools/migrate.sh ${cancer} METH hcmi_${cancer}_methyl
    bash tools/build_results_file.sh HCMI_METH_TMPsubtypes.${cancer}.tsv hcmi_${cancer}_methyl ${cancer} METH cloudforest.jadbio.subscope

elif [[ ${cancer} == 'KID' ]]; then
    modified_cancer='KIRCKICH'
    bash RUN_MODEL.sh ${modified_cancer} METH cloudforest ../${file}
    bash RUN_MODEL.sh ${modified_cancer} METH jadbio ../${file}
    bash RUN_MODEL.sh ${modified_cancer} METH subscope ../${file}
    bash tools/migrate.sh ${modified_cancer} METH hcmi_${modified_cancer}_methyl
    bash tools/build_results_file.sh HCMI_METH_TMPsubtypes.${modified_cancer}.tsv hcmi_${modified_cancer}_methyl ${modified_cancer} METH cloudforest.jadbio.subscope

elif [[ ${cancer} == 'KIRCKICH' ]]; then
    bash RUN_MODEL.sh ${cancer} METH cloudforest ../${file}
    bash RUN_MODEL.sh ${cancer} METH jadbio ../${file}
    bash RUN_MODEL.sh ${cancer} METH subscope ../${file}
    bash tools/migrate.sh ${cancer} METH hcmi_${cancer}_methyl
    bash tools/build_results_file.sh HCMI_METH_TMPsubtypes.${cancer}.tsv hcmi_${cancer}_methyl ${cancer} METH cloudforest.jadbio.subscope

elif [[ ${cancer} == 'LIHCCHOL' ]]; then
    bash RUN_MODEL.sh ${cancer} METH cloudforest ../${file}
    bash RUN_MODEL.sh ${cancer} METH jadbio ../${file}
    bash RUN_MODEL.sh ${cancer} METH subscope ../${file}
    bash tools/migrate.sh ${cancer} METH hcmi_${cancer}_methyl
    bash tools/build_results_file.sh HCMI_METH_TMPsubtypes.${cancer}.tsv hcmi_${cancer}_methyl ${cancer} METH cloudforest.jadbio.subscope

elif [[ ${cancer} == 'LUNG' ]]; then
    modified_cancer='LUAD'
    bash RUN_MODEL.sh ${modified_cancer} METH cloudforest ../${file}
    bash RUN_MODEL.sh ${modified_cancer} METH jadbio ../${file}
    bash RUN_MODEL.sh ${modified_cancer} METH subscope ../${file}
    bash tools/migrate.sh ${modified_cancer} METH hcmi_${modified_cancer}_methyl
    bash tools/build_results_file.sh HCMI_METH_TMPsubtypes.${modified_cancer}.tsv hcmi_${modified_cancer}_methyl ${modified_cancer} METH cloudforest.jadbio.subscope
    modified_cancer='LUSC'
    bash RUN_MODEL.sh ${modified_cancer} METH cloudforest ../${file}
    bash RUN_MODEL.sh ${modified_cancer} METH jadbio ../${file}
    bash RUN_MODEL.sh ${modified_cancer} METH subscope ../${file}
    bash tools/migrate.sh ${modified_cancer} METH hcmi_${modified_cancer}_methyl
    bash tools/build_results_file.sh HCMI_METH_TMPsubtypes.${modified_cancer}.tsv hcmi_${modified_cancer}_methyl ${modified_cancer} METH cloudforest.jadbio.subscope

elif [[ ${cancer} == 'OV' ]]; then
    bash RUN_MODEL.sh ${cancer} METH cloudforest ../${file}
    bash RUN_MODEL.sh ${cancer} METH jadbio ../${file}
    bash RUN_MODEL.sh ${cancer} METH subscope ../${file}
    bash tools/migrate.sh ${cancer} METH hcmi_${cancer}_methyl
    bash tools/build_results_file.sh HCMI_METH_TMPsubtypes.${cancer}.tsv hcmi_${cancer}_methyl ${cancer} METH cloudforest.jadbio.subscope

elif [[ ${cancer} == 'PAAD' ]]; then
    bash RUN_MODEL.sh ${cancer} METH skgrid ../${file}
    bash RUN_MODEL.sh ${cancer} METH aklimate ../${file}
    bash RUN_MODEL.sh ${cancer} METH cloudforest ../${file}
    bash RUN_MODEL.sh ${cancer} METH jadbio ../${file}
    bash RUN_MODEL.sh ${cancer} METH subscope ../${file}
    bash tools/migrate.sh ${cancer} METH hcmi_${cancer}_methyl
    bash tools/build_results_file.sh HCMI_METH_TMPsubtypes.${cancer}.tsv hcmi_${cancer}_methyl ${cancer} METH skgrid.aklimate.cloudforest.jadbio.subscope

elif [[ ${cancer} == 'SARC' ]]; then
    bash RUN_MODEL.sh ${cancer} METH cloudforest ../${file}
    bash RUN_MODEL.sh ${cancer} METH jadbio ../${file}
    bash RUN_MODEL.sh ${cancer} METH subscope ../${file}
    bash tools/migrate.sh ${cancer} METH hcmi_${cancer}_methyl
    bash tools/build_results_file.sh HCMI_METH_TMPsubtypes.${cancer}.tsv hcmi_${cancer}_methyl ${cancer} METH cloudforest.jadbio.subscope

elif [[ ${cancer} == 'SKCM' ]]; then
    bash RUN_MODEL.sh ${cancer} METH cloudforest ../${file}
    bash RUN_MODEL.sh ${cancer} METH jadbio ../${file}
    bash RUN_MODEL.sh ${cancer} METH subscope ../${file}
    bash tools/migrate.sh ${cancer} METH hcmi_${cancer}_methyl
    bash tools/build_results_file.sh HCMI_METH_TMPsubtypes.${cancer}.tsv hcmi_${cancer}_methyl ${cancer} METH cloudforest.jadbio.subscope

elif [[ ${cancer} == 'UCEC' ]]; then
    bash RUN_MODEL.sh ${cancer} METH skgrid ../${file}
    bash RUN_MODEL.sh ${cancer} METH aklimate ../${file}
    bash RUN_MODEL.sh ${cancer} METH cloudforest ../${file}
    bash RUN_MODEL.sh ${cancer} METH jadbio ../${file}
    bash RUN_MODEL.sh ${cancer} METH subscope ../${file}
    bash tools/migrate.sh ${cancer} METH hcmi_${cancer}_methyl
    bash tools/build_results_file.sh HCMI_METH_TMPsubtypes.${cancer}.tsv hcmi_${cancer}_methyl ${cancer} METH skgrid.aklimate.cloudforest.jadbio.subscope
fi

mv hcmi*_methyl ../data/classifier_methyl/ml_predictions/
cd ..