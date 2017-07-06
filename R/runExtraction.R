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
    cat(" * Extracting: Traditional meta-features\n")
    mfe.file = paste0("mfeats/", datafile, "/mfeFeatures.RData")
    if(file.exists(file = mfe.file)) {
      cat("   - skipping, feature file already exists\n")
    } else {
      mfe.feat = getMfeFeatures(data = data)
      save(mfe.feat, file = mfe.file)
    }
  }

  if(option == "stat" | option == "all") {
    cat(" * Extracting: Statlog meta-features\n")
    stat.file = paste0("mfeats/", datafile, "/statlogFeatures.RData")
    
    if(file.exists(file = stat.file)) {
      cat("   - skipping, feature file already exists\n")
    } else {
      stat = tryCatch({
        getStatlogFeatures(data = data)
      }, error = function(err) {
        stop(err)
      })
      save(stat, file = stat.file)
    }
  }

  if(option == "comp" | option == "all") {
    cat(" * Extracting: Data Complexity meta-features\n")
    comp.file = paste0("mfeats/", datafile, "/dataCompFeatures.RData")
    
    if(file.exists(file = comp.file)) {
      cat("   - skipping, feature file already exists\n")
    } else {
      comp = tryCatch({
        getCompFeatures(data = pre.data)
      }, error = function(err) {
        stop(err)
      })
      save(comp, file = comp.file)
    }
  }

  if(option == "cnet" | option == "all") {
    cat(" * Extracting: Complex Network meta-features\n")
    cnet.file = paste0("mfeats/", datafile, "/compNetFeatures.RData")
    if(file.exists(file = cnet.file)) {
      cat("   - skipping, feature file already exists\n")
    } else {
      cnet = tryCatch({
        getCnetFeatures(data = data, epson = 0.15)
      }, error = function(err) {
        stop(err)
      })
      save(cnet, file = cnet.file)
    }
  }

  if(option == "pca" | option == "all") {
    cat(" * Extracting: PCA meta-features\n")
    pca.file = paste0("mfeats/", datafile, "/pcaFeatures.RData")
    if(file.exists(file = pca.file)) {
      cat("   - skipping, feature file already exists\n")
    } else {
      pca.feat = tryCatch({
        getPCAFeatures(data = pre.data)
      }, error = function(err) {
        stop(err)
      })
      save(pca.feat, file = pca.file)
    }
  }

}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
