# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

  devtools::load_all()
  datafile = "13_breast-cancer"
  # datafile = "seq_target_92"
  # option   = "stat"

  data = RWeka::read.arff(file = paste0("data/datasets/", datafile, ".arff"))
  pre.data = preProcessing(data = data)
  # mfe.feat = getMfeFeatures(data = data)
 
  # comp     = getCompFeatures(data = pre.data)
  # cnet     = getCnetFeatures(data = data)
  # pca.feat = getPCAFeatures(data = pre.data)
  # stat = getStatlogFeatures(data = data)

  runExtraction(datafile = datafile)
  
# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
