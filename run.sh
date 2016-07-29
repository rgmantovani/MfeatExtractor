#!/bin/bash

#module load gcc
# module load R
R CMD BATCH --no-save --no-restore mainFeatureAnalysis.R out-Mfeat.log
