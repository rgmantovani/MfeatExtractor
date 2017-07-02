# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

runExtraction = function(datafile, option = "all") {

  # read dataset
  # preprocessing is required just for comp ?
  #   - check if there is a correspondent dataset version at preprocessed subdir
  #   - if no, calls preprocessing
  #   - save the new version at the preprocessed subdir


  if(option == "mfe" | option == "all") {
    cat(" - extracting: mfe meta-features\n")
    
    mfe.feat = getMfeFeatures(data = data)

    # _ saving 

  }

  if(option == "cnet" | option == "all") {
    cat(" - extracting: cnet meta-features\n")

    cnet.feat = getCnetFeatures(data = data)

  }

  if(option == "comp" | option == "all") {
    cat(" - extracting: comp meta-features\n")

    # get preprocessed dataset

    comp.feat = getCompFeatures(data = data)

    # - saving 

  }

  if(option == "pca" | option == "all") {
    cat(" - extracting: pca meta-features\n")
  
    # get preprocessed dataset
    pca.feat = getPCAFeatures(data = data)


  }

}


# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
