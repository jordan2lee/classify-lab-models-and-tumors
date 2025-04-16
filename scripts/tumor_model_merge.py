#!/user/bin/python3

# Combine tumor and model samples into one file (for a cohort)
import pandas as pd
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-c','--cohort', required=True, help='file')
parser.add_argument('-o','--outfile', required=True, help='file')
args = parser.parse_args()

tumor =pd.read_csv('data/classifier_gexp_v2/ml_predictions_qrank/combo/HCMI_TMPsubtype_qRank_{}_Tumor.tsv'.format(args.cohort), sep='\t')
model =pd.read_csv('data/classifier_gexp_v2/ml_predictions_qrank/combo/HCMI_TMPsubtype_qRank_{}_Model.tsv'.format(args.cohort), sep='\t')
assert len(set(list(tumor['sampleID'])+ list(model['sampleID'])))== len(list(tumor['sampleID'])+ list(model['sampleID'])), 'error: samples overlap in tumor and model file'

combined_matrix = pd.concat([tumor, model]).reset_index(drop=True)
combined_matrix.to_csv(args.outfile, sep='\t', index=False)
