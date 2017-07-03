# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

  devtools::load_all()

  # datafile = "13_breast-cancer"
  # datafile = "61_iris.arff"
  # datafile = "1037_ada_prior"
  option   = "pca"

  # cat(" ---------------------------- \n")
  # cat(" ** Meta-features extractor ** \n")
  # cat(" ---------------------------- \n")

  # runExtraction(datafile = datafile, option = option)    

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

  all.files = list.files("data/datasets/")
  files =  gsub(x = all.files, pattern=".arff", replacement="")

  for(datafile in files) {
    
    cat(paste0(" - Datafile: \t", datafile, "\n"))
    cat(paste0(" - Features: \t", option, "\n"))
    cat(" ---------------------------- \n")

    runExtraction(datafile = datafile, option = option)    
  }
  
  cat("* Finished!\n")
  cat(" ---------------------------- \n")

  # *** checking functions individually ***

  # data = RWeka::read.arff(file = paste0("data/datasets/", datafile, ".arff"))
  # pre.data = preProcessing(data = data)
  
  # mfe.feat = getMfeFeatures(data = data)
  # comp     = getCompFeatures(data = pre.data)
  # cnet     = getCnetFeatures(data = data)
  # pca.feat = getPCAFeatures(data = pre.data)

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
