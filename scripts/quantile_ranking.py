#!/usr/bin/env python

import argparse
import pandas as pd

def quantileRank(src,dst):
    dstT = dst.transpose()
    rankMean = dstT.stack().groupby(dstT.rank(method='first').stack().astype(int)).mean()
    rankMean = rankMean[ rankMean != 0.0 ].reset_index()[0] # drop zeros

    srcRanks = (src.rank(axis=1) * (src.shape[1])/(len(rankMean)) ).astype(int)
    srcRanks = (srcRanks.transpose() * ( (len(rankMean)-1) / (srcRanks.max(axis=1)))).astype(int).transpose()

    out = srcRanks.map(lambda x:rankMean[x])
    return out

if __name__ == "__main__":

    parser = argparse.ArgumentParser()
    parser.add_argument("--src")
    parser.add_argument("--dst")
    parser.add_argument("--out")

    args = parser.parse_args()

    src = pd.read_csv(args.src, sep="\t", index_col=0)
    dst = pd.read_csv(args.dst, sep="\t", index_col=0)

    isect = src.columns.intersection(dst.columns)

    scaled = quantileRank(src[ isect ], dst[ isect])

    scaled.to_csv(args.out, sep="\t")
