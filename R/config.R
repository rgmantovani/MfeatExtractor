# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

library("R.utils")
library("CORElearn")
library("e1071")
library("FNN")
library("foreign")
library("infotheo")
library("irr")
library("rpart")
library("rrcov")
library("igraph")

library("OpenML")
library("mlr")
library("BBmisc")
library("checkmate")
library("BatchExperiments")

# home directory
DIR = getwd()

# extract features
GET.STATLOG = TRUE
GET.COMPLEX = TRUE
GET.NETWORK = FALSE

# OpenML settings
# Please, replace it by your own OpenML apikey
# saveOMLConfig(apikey = "your openml api key", overwrite = TRUE)
saveOMLConfig(apikey = "76444ac061f2b76258c96f680f0c6ae0", overwrite = TRUE)
setOMLConfig(arff.reader = "farff")

# mlr settings 
configureMlr(on.learner.error = "warn")
configureMlr(show.info = TRUE)

# Statlog features names
STAT = c("cls", "atr", "num", "nom", "spl", "dim", "numRate", "nomRate", "symMin", "symMax", 
  "symMan", "symSd", "symSum", "clMin", "clMax", "clMean", "clSd", "sks", "sksP", "kts", 
  "ktsP", "absC", "canC", "fnd", "clEnt", "nClEnt", "atrEnt", "nAtrEnt", "jEnt", "mutInf", 
  "eAttr", "noiSig", "node", "leave", "nodeAtr", "nodeIns", "leafCor", "lMin", "lMax", "lMean",
   "lSd", "bMin", "bMax", "bMean", "bSd", "atrMin", "atrMax", "atrMean", "atrSd", "nb", "lda",
    "stMin", "stMax", "stMean", "stSd", "stMinGain", "stRand", "nn", "nnSd", "treeTime", 
    "nbTime", "ldaTime", "stTime", "nnTime", "sTime", "staTime", "infTime", "ToTime")

# linear metrics
REPLACE = c("f1v", "l1", "l2", "l3")

# complexity metrics
COMPLEX = c("f1", "f1v", "f2", "f3", "f4", "l1", "l2", "l3", "n1", "n2", "n3", "n4", "t1", "t2")

# complex netwrork meta-features
CNET = c("edges", "degree", "density", "maxComp", "closeness", "betweenness", "clsCoef", "hubs",
  "avgPath")

# Removing these meta-features
REMOVE = c("lda", "ldaTime",  "nnSd", "lMin")

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
