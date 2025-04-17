#!/usr/bin/env python

cancer=${1}
outpath=${2}

cd gdan-tmp-models 

if [[ ${cancer} == 'BLCA' ]]; then
    bash RUN_MODEL.sh ${cancer} GEXP skgrid ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash RUN_MODEL.sh ${cancer} GEXP cloudforest ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash RUN_MODEL.sh ${cancer} GEXP subscope ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash tools/migrate.sh ${cancer} GEXP hcmi_${cancer}_Tumor.QRANK
    bash tools/build_results_file.sh HCMI_GEXP_TMPsubtypes.${cancer}.Tumor.tsv hcmi_${cancer}_Tumor.QRANK ${cancer} GEXP skgrid.cloudforest.subscope

    bash RUN_MODEL.sh ${cancer} GEXP skgrid ../${outpath}/${cancer}_qrank_Model.tsv
    bash RUN_MODEL.sh ${cancer} GEXP cloudforest ../${outpath}/${cancer}_qrank_Model.tsv
    bash RUN_MODEL.sh ${cancer} GEXP subscope ../${outpath}/${cancer}_qrank_Model.tsv
    bash tools/migrate.sh ${cancer} GEXP hcmi_${cancer}_Model.QRANK
    bash tools/build_results_file.sh HCMI_GEXP_TMPsubtypes.${cancer}.Model.tsv hcmi_${cancer}_Model.QRANK ${cancer} GEXP skgrid.cloudforest.subscope
elif [[ ${cancer} == 'COADREAD' ]]; then
    bash RUN_MODEL.sh ${cancer} GEXP skgrid ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash RUN_MODEL.sh ${cancer} GEXP cloudforest ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash RUN_MODEL.sh ${cancer} GEXP subscope ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash tools/migrate.sh ${cancer} GEXP hcmi_${cancer}_Tumor.QRANK
    bash tools/build_results_file.sh HCMI_GEXP_TMPsubtypes.${cancer}.Tumor.tsv hcmi_${cancer}_Tumor.QRANK ${cancer} GEXP skgrid.cloudforest.subscope

    bash RUN_MODEL.sh ${cancer} GEXP skgrid ../${outpath}/${cancer}_qrank_Model.tsv
    bash RUN_MODEL.sh ${cancer} GEXP cloudforest ../${outpath}/${cancer}_qrank_Model.tsv
    bash RUN_MODEL.sh ${cancer} GEXP subscope ../${outpath}/${cancer}_qrank_Model.tsv
    bash tools/migrate.sh ${cancer} GEXP hcmi_${cancer}_Model.QRANK
    bash tools/build_results_file.sh HCMI_GEXP_TMPsubtypes.${cancer}.Model.tsv hcmi_${cancer}_Model.QRANK ${cancer} GEXP skgrid.cloudforest.subscope
elif [[ ${cancer} == 'ESO' ]]; then
    modified_cancer='ESCC'
    bash RUN_MODEL.sh ${modified_cancer} GEXP skgrid ../${outpath}/${modified_cancer}_qrank_Tumor.tsv
    bash RUN_MODEL.sh ${modified_cancer} GEXP cloudforest ../${outpath}/${modified_cancer}_qrank_Tumor.tsv
    bash RUN_MODEL.sh ${modified_cancer} GEXP subscope ../${outpath}/${modified_cancer}_qrank_Tumor.tsv
    bash tools/migrate.sh ${modified_cancer} GEXP hcmi_${modified_cancer}_Tumor.QRANK
    bash tools/build_results_file.sh HCMI_GEXP_TMPsubtypes.${modified_cancer}.Tumor.tsv hcmi_${modified_cancer}_Tumor.QRANK ${modified_cancer} GEXP skgrid.cloudforest.subscope

    bash RUN_MODEL.sh ${modified_cancer} GEXP skgrid ../${outpath}/${modified_cancer}_qrank_Model.tsv
    bash RUN_MODEL.sh ${modified_cancer} GEXP cloudforest ../${outpath}/${modified_cancer}_qrank_Model.tsv
    bash RUN_MODEL.sh ${modified_cancer} GEXP subscope ../${outpath}/${modified_cancer}_qrank_Model.tsv
    bash tools/migrate.sh ${modified_cancer} GEXP hcmi_${modified_cancer}_Model.QRANK
    bash tools/build_results_file.sh HCMI_GEXP_TMPsubtypes.${modified_cancer}.Model.tsv hcmi_${modified_cancer}_Model.QRANK ${modified_cancer} GEXP skgrid.cloudforest.subscope

    modified_cancer='GEA'
    bash RUN_MODEL.sh ${modified_cancer} GEXP skgrid ../${outpath}/${modified_cancer}_qrank_Tumor.tsv
    bash RUN_MODEL.sh ${modified_cancer} GEXP cloudforest ../${outpath}/${modified_cancer}_qrank_Tumor.tsv
    bash RUN_MODEL.sh ${modified_cancer} GEXP subscope ../${outpath}/${modified_cancer}_qrank_Tumor.tsv
    bash tools/migrate.sh ${modified_cancer} GEXP hcmi_${modified_cancer}_Tumor.QRANK
    bash tools/build_results_file.sh HCMI_GEXP_TMPsubtypes.${modified_cancer}.Tumor.tsv hcmi_${modified_cancer}_Tumor.QRANK ${modified_cancer} GEXP skgrid.cloudforest.subscope

    bash RUN_MODEL.sh ${modified_cancer} GEXP skgrid ../${outpath}/${modified_cancer}_qrank_Model.tsv
    bash RUN_MODEL.sh ${modified_cancer} GEXP cloudforest ../${outpath}/${modified_cancer}_qrank_Model.tsv
    bash RUN_MODEL.sh ${modified_cancer} GEXP subscope ../${outpath}/${modified_cancer}_qrank_Model.tsv
    bash tools/migrate.sh ${modified_cancer} GEXP hcmi_${modified_cancer}_Model.QRANK
    bash tools/build_results_file.sh HCMI_GEXP_TMPsubtypes.${modified_cancer}.Model.tsv hcmi_${modified_cancer}_Model.QRANK ${modified_cancer} GEXP skgrid.cloudforest.subscope
elif [[ ${cancer} == 'KID' ]]; then
    modified_cancer='KIRCKICH'
    bash RUN_MODEL.sh ${modified_cancer} GEXP aklimate ../${outpath}/${modified_cancer}_qrank_Tumor.tsv
    bash RUN_MODEL.sh ${modified_cancer} GEXP cloudforest ../${outpath}/${modified_cancer}_qrank_Tumor.tsv
    bash RUN_MODEL.sh ${modified_cancer} GEXP subscope ../${outpath}/${modified_cancer}_qrank_Tumor.tsv
    bash tools/migrate.sh ${modified_cancer} GEXP hcmi_${modified_cancer}_Tumor.QRANK
    bash tools/build_results_file.sh HCMI_GEXP_TMPsubtypes.${modified_cancer}.Tumor.tsv hcmi_${modified_cancer}_Tumor.QRANK ${modified_cancer} GEXP aklimate.cloudforest.subscope

    bash RUN_MODEL.sh ${modified_cancer} GEXP aklimate ../${outpath}/${modified_cancer}_qrank_Model.tsv
    bash RUN_MODEL.sh ${modified_cancer} GEXP cloudforest ../${outpath}/${modified_cancer}_qrank_Model.tsv
    bash RUN_MODEL.sh ${modified_cancer} GEXP subscope ../${outpath}/${modified_cancer}_qrank_Model.tsv
    bash tools/migrate.sh ${modified_cancer} GEXP hcmi_${modified_cancer}_Model.QRANK
    bash tools/build_results_file.sh HCMI_GEXP_TMPsubtypes.${modified_cancer}.Model.tsv hcmi_${modified_cancer}_Model.QRANK ${modified_cancer} GEXP aklimate.cloudforest.subscope
elif [[ ${cancer} == 'LIHCCHOL' ]]; then
    bash RUN_MODEL.sh ${cancer} GEXP cloudforest ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash RUN_MODEL.sh ${cancer} GEXP subscope ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash tools/migrate.sh ${cancer} GEXP hcmi_${cancer}_Tumor.QRANK
    bash tools/build_results_file.sh HCMI_GEXP_TMPsubtypes.${cancer}.Tumor.tsv hcmi_${cancer}_Tumor.QRANK ${cancer} GEXP cloudforest.subscope

    bash RUN_MODEL.sh ${cancer} GEXP cloudforest ../${outpath}/${cancer}_qrank_Model.tsv
    bash RUN_MODEL.sh ${cancer} GEXP subscope ../${outpath}/${cancer}_qrank_Model.tsv
    bash tools/migrate.sh ${cancer} GEXP hcmi_${cancer}_Model.QRANK
    bash tools/build_results_file.sh HCMI_GEXP_TMPsubtypes.${cancer}.Model.tsv hcmi_${cancer}_Model.QRANK ${cancer} GEXP cloudforest.subscope

elif [[ ${cancer} == 'OV' ]]; then
    bash RUN_MODEL.sh ${cancer} GEXP skgrid ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash RUN_MODEL.sh ${cancer} GEXP aklimate ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash RUN_MODEL.sh ${cancer} GEXP cloudforest ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash RUN_MODEL.sh ${cancer} GEXP jadbio ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash RUN_MODEL.sh ${cancer} GEXP subscope ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash tools/migrate.sh ${cancer} GEXP hcmi_${cancer}_Tumor.QRANK
    bash tools/build_results_file.sh HCMI_GEXP_TMPsubtypes.${cancer}.Tumor.tsv hcmi_${cancer}_Tumor.QRANK ${cancer} GEXP skgrid.aklimate.cloudforest.jadbio.subscope

    bash RUN_MODEL.sh ${cancer} GEXP skgrid ../${outpath}/${cancer}_qrank_Model.tsv
    bash RUN_MODEL.sh ${cancer} GEXP aklimate ../${outpath}/${cancer}_qrank_Model.tsv
    bash RUN_MODEL.sh ${cancer} GEXP cloudforest ../${outpath}/${cancer}_qrank_Model.tsv
    bash RUN_MODEL.sh ${cancer} GEXP jadbio ../${outpath}/${cancer}_qrank_Model.tsv
    bash RUN_MODEL.sh ${cancer} GEXP subscope ../${outpath}/${cancer}_qrank_Model.tsv
    bash tools/migrate.sh ${cancer} GEXP hcmi_${cancer}_Model.QRANK
    bash tools/build_results_file.sh HCMI_GEXP_TMPsubtypes.${cancer}.Model.tsv hcmi_${cancer}_Model.QRANK ${cancer} GEXP skgrid.aklimate.cloudforest.jadbio.subscope
elif [[ ${cancer} == 'PAAD' ]]; then
    bash RUN_MODEL.sh ${cancer} GEXP skgrid ../${outpath}/${cancer}_qrank_Model.tsv
    bash RUN_MODEL.sh ${cancer} MULTI aklimate ../${outpath}/${cancer}_qrank_Model.tsv
    bash RUN_MODEL.sh ${cancer} GEXP cloudforest ../${outpath}/${cancer}_qrank_Model.tsv
    bash RUN_MODEL.sh ${cancer} GEXP jadbio ../${outpath}/${cancer}_qrank_Model.tsv
    bash RUN_MODEL.sh ${cancer} GEXP subscope ../${outpath}/${cancer}_qrank_Model.tsv
    bash tools/migrate.sh ${cancer} GEXP hcmi_${cancer}_Model.QRANK
    bash tools/build_results_file.sh HCMI_GEXP_TMPsubtypes.${cancer}.Model.tsv hcmi_${cancer}_Model.QRANK ${cancer} GEXP skgrid.aklimate.cloudforest.jadbio.subscope
    
    bash RUN_MODEL.sh ${cancer} GEXP skgrid ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash RUN_MODEL.sh ${cancer} MULTI aklimate ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash RUN_MODEL.sh ${cancer} GEXP cloudforest ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash RUN_MODEL.sh ${cancer} GEXP jadbio ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash RUN_MODEL.sh ${cancer} GEXP subscope ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash tools/migrate.sh ${cancer} GEXP hcmi_${cancer}_Tumor.QRANK
    bash tools/build_results_file.sh HCMI_GEXP_TMPsubtypes.${cancer}.Tumor.tsv hcmi_${cancer}_Tumor.QRANK ${cancer} GEXP skgrid.aklimate.cloudforest.jadbio.subscope

elif [[ ${cancer} == 'SARC' ]]; then
    bash RUN_MODEL.sh ${cancer} GEXP skgrid ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash RUN_MODEL.sh ${cancer} GEXP aklimate ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash RUN_MODEL.sh ${cancer} GEXP cloudforest ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash RUN_MODEL.sh ${cancer} GEXP subscope ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash tools/migrate.sh ${cancer} GEXP hcmi_${cancer}_Tumor.QRANK
    bash tools/build_results_file.sh HCMI_GEXP_TMPsubtypes.${cancer}.Tumor.tsv hcmi_${cancer}_Tumor.QRANK ${cancer} GEXP skgrid.aklimate.cloudforest.subscope

    bash RUN_MODEL.sh ${cancer} GEXP skgrid ../${outpath}/${cancer}_qrank_Model.tsv
    bash RUN_MODEL.sh ${cancer} GEXP aklimate ../${outpath}/${cancer}_qrank_Model.tsv
    bash RUN_MODEL.sh ${cancer} GEXP cloudforest ../${outpath}/${cancer}_qrank_Model.tsv
    bash RUN_MODEL.sh ${cancer} GEXP subscope ../${outpath}/${cancer}_qrank_Model.tsv
    bash tools/migrate.sh ${cancer} GEXP hcmi_${cancer}_Model.QRANK
    bash tools/build_results_file.sh HCMI_GEXP_TMPsubtypes.${cancer}.Model.tsv hcmi_${cancer}_Model.QRANK ${cancer} GEXP skgrid.aklimate.cloudforest.subscope

elif [[ ${cancer} == 'SKCM' ]]; then
    bash RUN_MODEL.sh ${cancer} GEXP cloudforest ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash RUN_MODEL.sh ${cancer} GEXP subscope ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash tools/migrate.sh ${cancer} GEXP hcmi_${cancer}_Tumor.QRANK
    bash tools/build_results_file.sh HCMI_GEXP_TMPsubtypes.${cancer}.Tumor.tsv hcmi_${cancer}_Tumor.QRANK ${cancer}  GEXP cloudforest.subscope

    bash RUN_MODEL.sh ${cancer} GEXP cloudforest ../${outpath}/${cancer}_qrank_Model.tsv
    bash RUN_MODEL.sh ${cancer} GEXP subscope ../${outpath}/${cancer}_qrank_Model.tsv
    bash tools/migrate.sh ${cancer} GEXP hcmi_${cancer}_Model.QRANK
    bash tools/build_results_file.sh HCMI_GEXP_TMPsubtypes.${cancer}.Model.tsv hcmi_${cancer}_Model.QRANK ${cancer}  GEXP cloudforest.subscope

elif [[ ${cancer} == 'UCEC' ]]; then
    bash RUN_MODEL.sh ${cancer} GEXP skgrid ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash RUN_MODEL.sh ${cancer} GEXP cloudforest ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash RUN_MODEL.sh ${cancer} GEXP subscope ../${outpath}/${cancer}_qrank_Tumor.tsv
    bash tools/migrate.sh ${cancer} GEXP hcmi_${cancer}_Tumor.QRANK
    bash tools/build_results_file.sh HCMI_GEXP_TMPsubtypes.${cancer}.Tumor.tsv hcmi_${cancer}_Tumor.QRANK ${cancer}  GEXP skgrid.cloudforest.subscope

    bash RUN_MODEL.sh ${cancer} GEXP skgrid ../${outpath}/${cancer}_qrank_Model.tsv
    bash RUN_MODEL.sh ${cancer} GEXP cloudforest ../${outpath}/${cancer}_qrank_Model.tsv
    bash RUN_MODEL.sh ${cancer} GEXP subscope ../${outpath}/${cancer}_qrank_Model.tsv
    bash tools/migrate.sh ${cancer} GEXP hcmi_${cancer}_Model.QRANK
    bash tools/build_results_file.sh HCMI_GEXP_TMPsubtypes.${cancer}.Model.tsv hcmi_${cancer}_Model.QRANK ${cancer}  GEXP skgrid.cloudforest.subscope
fi

mv hcmi*QRANK ../data/classifier_gexp/ml_predictions_qrank/
cd ..