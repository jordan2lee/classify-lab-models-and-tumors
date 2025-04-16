#!/usr/bin/python

# Purpose: pull the most probable subtype across multiple cancer cohort (independent runs)
# ex. lung data was ran with LUAD and LUSC best classifiers. now need one subtype call per sample
# where either subtype in LUAD or LUSC can be allowed

import pandas as pd
import numpy as np
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-f1','--file1', type=str, help='input file 1', required=True)
parser.add_argument('-f2','--file2', type=str, help='input file 2', required=True)
parser.add_argument('-c','--cancer', type=str, help='cancer cohort', choices=['LUNG', 'ESO'], required=True)
parser.add_argument('-o', '--outfile',required = False, help="output file name",  type=str)
args = parser.parse_args()

def mean_conf_subset(df, row):
    '''
    Purpose: Calculate mean model conf for models that had predicted subtype that matched voted subtype

    input full df that was output of summary file from voting method.
        then the row name (sample) that want to analyze'''
    # Pull voting method selected subtype
    vote_subtype = df.loc[sample, 'subtype' ]
    cols = [a for a in df.columns if '_call' in a]
    # Calculate mean model conf for models that had predicted subtype that matched voted subtype
    method = []
    for c in cols:
        if vote_subtype == df.loc[sample,c]:
            method.append(':'.join([c.split('_call')[0], vote_subtype ]))
    mean_conf_called = np.mean(list(df.loc[sample, method]))
    return mean_conf_called, vote_subtype

df_1 = pd.read_csv(args.file1, sep='\t', index_col=0)
df_2 = pd.read_csv(args.file2, sep='\t', index_col=0)
samples_consolidate = []
subtype_consolidate = []
for sample in list(df_1.index):
    # calculate model conf groups
    compare_1= mean_conf_subset(df_1,sample)
    compare_2 = mean_conf_subset(df_2,sample)
    # report subtype with highest conf
    samples_consolidate.append(sample)
    if compare_1[0]> compare_2[0]:
        subtype_consolidate.append(compare_1[1])
    else:
        subtype_consolidate.append(compare_2[1])

res = pd.DataFrame(list(zip(samples_consolidate, subtype_consolidate)), columns=['sampleID', 'subtype'])
res.to_csv(args.outfile, sep='\t', index=False)
