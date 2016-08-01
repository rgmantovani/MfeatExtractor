# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------

getMetaFeatures = function(dataset, statlog = TRUE, complex = TRUE, network = TRUE) {

  cat(" * Getting features ... \n")
  dataset.dir = paste0("temp/", dataset$desc$id, "_", dataset$desc$name)
  
  ret = c()
  
  # Extracting Statlog meta-features
  if(statlog) {
    cat("\t -> Statlog features: \t\t")
    stat.file = paste0(dataset.dir, "/statlogFeatures.RData")
    if(!file.exists(stat.file)) {
      stat = getStatlogFeatures(dataset$data)
      save(stat, file = stat.file)
    } else {
      temp = load(stat.file)
    }
    cat("extracted. \n")
    names(stat) = STAT
    ret = c(ret, stat)
  }

  # Extracting Statlog meta-features
  if(complex) {
    cat("\t -> Data complexity features: \t")
    comp.file = paste0(dataset.dir, "/dataCompFeatures.RData")
    if(!file.exists(comp.file)) {
      # only numeric features
      dataset = puttingInStandard(dataset)
      comp = getDataComplexFeatures(dataset$data)
      save(comp, file = comp.file)
    } else {
      temp = load(comp.file)
    }
    cat("extracted. \n")
    names(comp) = COMPLEX
    ret = c(ret, comp)
  }

  # Extracting Complex Networks
  if(network) {
    cat("\t -> Complext network features: \t")
    cnet.file = paste0(dataset.dir, "/compNetFeatures.RData")
    if(!file.exists(cnet.file)) {
      cnet = getCompNetworkFeatures(dataset$data, epson = 0.15)
      save(cnet, file = cnet.file)
    }else{
      temp = load(cnet.file)
    }
    cat("extracted. \n")
    names(cnet) = CNET
    ret = c(ret, cnet)
  }
 
	return(ret)
}

# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------