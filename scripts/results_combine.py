#!/usr/bin/python

import pandas as pd
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-c','--cancer', required=True, help='specify. ex PAAD')
parser.add_argument('-in1','--input1', required=True, help='input file 1')
parser.add_argument('-in2','--input2', required=True, help='input file 2')
parser.add_argument('-out','--output', required=True, help='output')
args = parser.parse_args()

tumor = pd.read_csv(args.input1, sep='\t', index_col=0)
model = pd.read_csv(args.input2, sep='\t', index_col=0)
assert list(tumor.columns)==list(model.columns)
combo = pd.concat([tumor, model])
assert combo.shape[0]== tumor.shape[0]+model.shape[0]
combo.to_csv(args.output,sep='\t', index=True)
