#!/usr/bin/bash
cancer=${1}
tumor_file=${2}
model_file=${3}
outpath=${4}

# If cancer contains 2 cohorts and needs to be modified
if [[ ${cancer} == 'LUNG' || ${cancer} == 'ESO' ]]; then
  if [[ ${cancer} == 'LUNG' ]]; then
    modified_cancer_1='LUAD'
    modified_cancer_2='LUSC'
  elif [[ ${cancer} == 'ESO' ]]; then
    modified_cancer_1='GEA'
    modified_cancer_2='ESCC'
  fi

  # Modified Cancer 1:
  # Tumor
  base_path=$(dirname $tumor_file)
  orig_file=$(echo "$tumor_file" | sed "s/.*\///")
  new_name="${orig_file/${cancer}/${modified_cancer_1}}"
  new_file=$base_path'/'$new_name
  python scripts/quantile_ranking.py \
    --src ${new_file} \
    --dst gdan-tmp-models/tools/TMP_20230209/${modified_cancer_1}_v12_20210228.tsv \
    --out ${outpath}/${modified_cancer_1}_qrank_Tumor.tsv
  # Model
  base_path=$(dirname $model_file)
  orig_file=$(echo "$model_file" | sed "s/.*\///")
  new_name="${orig_file/${cancer}/${modified_cancer_1}}"
  new_file=$base_path'/'$new_name
  python scripts/quantile_ranking.py \
    --src ${new_file} \
    --dst gdan-tmp-models/tools/TMP_20230209/${modified_cancer_1}_v12_20210228.tsv \
    --out ${outpath}/${modified_cancer_1}_qrank_Model.tsv

  
  # Modified Cancer 2:
  # Tumor
  base_path=$(dirname $tumor_file)
  orig_file=$(echo "$tumor_file" | sed "s/.*\///")
  new_name="${orig_file/${cancer}/${modified_cancer_2}}"
  new_file=$base_path'/'$new_name
  python scripts/quantile_ranking.py \
    --src ${new_file} \
    --dst gdan-tmp-models/tools/TMP_20230209/${modified_cancer_2}_v12_20210228.tsv \
    --out ${outpath}/${modified_cancer_2}_qrank_Tumor.tsv
  # Model
  base_path=$(dirname $model_file)
  orig_file=$(echo "$model_file" | sed "s/.*\///")
  new_name="${orig_file/${cancer}/${modified_cancer_2}}"
  new_file=$base_path'/'$new_name
  python scripts/quantile_ranking.py \
    --src ${new_file} \
    --dst gdan-tmp-models/tools/TMP_20230209/${modified_cancer_2}_v12_20210228.tsv \
    --out ${outpath}/${modified_cancer_2}_qrank_Model.tsv


# If standard run with no change needed
else
  # Tumor
  python scripts/quantile_ranking.py \
    --src ${tumor_file} \
    --dst gdan-tmp-models/tools/TMP_20230209/${cancer}_v12_20210228.tsv \
    --out ${outpath}/${cancer}_qrank_Tumor.tsv
  # Model
  python scripts/quantile_ranking.py \
    --src ${model_file} \
    --dst gdan-tmp-models/tools/TMP_20230209/${cancer}_v12_20210228.tsv \
    --out ${outpath}/${cancer}_qrank_Model.tsv
fi
