# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------

getMetaFeatures = function(dataset) {

  cat(" * Getting features ... \n")
  dataset.dir = paste0("temp/", dataset$desc$id, "_", dataset$desc$name)
  
  cat("       -> Statlog features ... \n")
  stat.file = paste0(dataset.dir, "/statlogFeatures.RData")
  if(!file.exists(stat.file)) {
    stat = getStatlogFeatures(dataset$data)
    save(stat, file = stat.file)
  }else{
    temp = load(stat.file)
  }
       
  cat("       -> Data complexity features ... \n")
  comp.file = paste0(dataset.dir, "/dataCompFeatures.RData")
  if(!file.exists(comp.file)) {
    # only numeric features
    dataset = puttingInStandard(dataset)
    comp = getDataComplexFeatures(dataset$data)
    save(comp, file = comp.file)
  }else{
    temp = load(comp.file)
  }

  cat("       -> Complex networks features ... \n")
  cnet.file = paste0(dataset.dir, "/compNetFeatures.RData")
  if(!file.exists(cnet.file)) {
    cnet = getCompNetworkFeatures(dataset$data, epson = 0.15)
    save(cnet, file = cnet.file)
  }else{
    temp = load(cnet.file)
  }

  all = c(stat, comp, cnet)

	return(all)
}

# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------