import pandas as pd
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-f','--tsv_file', required=True, help='file')
parser.add_argument('-fo','--output_file', required=True, help='file')
args = parser.parse_args()
df = pd.read_csv(args.tsv_file, sep='\t', index_col=0)
df = df.transpose()
df.to_csv(args.output_file, sep='\t', index=True)
