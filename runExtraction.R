# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

runExtraction = function(datafile, option = "all") {

  data = RWeka::read.arff(file = paste0("data/datasets/", datafile, ".arff"))

  dir.create(path = paste0("mfeats/", datafile), showWarning = FALSE, recursive = TRUE)

  # -----------------------------------------
  #  Obtaining preprocessed data, if required
  # -----------------------------------------

  pre.data = NULL
  if(option %in% c("comp", "pca", "all")) {

    pre.file = paste0("data/preprocessed/", datafile, ".arff")
    if(file.exists(pre.file)) {
      pre.data = RWeka::read.arff(file = pre.file)
    } else {
      pre.data = preProcessing(data = data)
      RWeka::write.arff(x = pre.data, file = pre.file)
    }
  }

  # -----------------------------------------
  # Extracting meta-features
  # -----------------------------------------

  if(option == "mfe" | option == "all") {
    
    cat(" - extracting: Traditional meta-features\n")
    
    mfe.feat = getMfeFeatures(data = data)
    save(mfe.feat, file = paste0(mfeat))

    # _ saving 

  }

  if(option == "cnet" | option == "all") {
    cat(" - extracting: Complex Network meta-features\n")

    cnet.feat = getCnetFeatures(data = data)

  }

  if(option == "comp" | option == "all") {
    cat(" - extracting: Data Complexity meta-features\n")

    # get preprocessed dataset

    comp.feat = getCompFeatures(data = data)

    # - saving 

  }

  if(option == "pca" | option == "all") {
    cat(" - extracting: PCA meta-features\n")
  
    # get preprocessed dataset
    pca.feat = getPCAFeatures(data = data)


  }

}


# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
