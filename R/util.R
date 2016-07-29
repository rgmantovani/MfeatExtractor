# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------

printDatasetInfo = function(dataset) {
 
  catf(" * Data info: ")
  cat("   - Dataset id:", dataset$desc$id, "\n")
  cat("   - Dataset name:", dataset$desc$name, "\n")
  cat("   - nFeatures: ", (ncol(dataset$data)-1), "\n")
  cat("   - nExamples: ", nrow(dataset$data), "\n")
  cat("   - nClasses: ", length(levels(dataset$data$Class)), "\n")
  
}

# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------

getAttrType = function(dataset){
  
  aux = unlist(lapply(1:ncol(dataset), function(i){
    if(class(dataset[,i]) == "numeric"){
      return ("num")
    }
    
    if(class(dataset[,i]) == "factor"){
      return ("fac")
    }
  }))
  return(aux)
}

# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------

puttingInStandard = function(dataset){
  flag = FALSE
  for(i in 1:(ncol(dataset$data))-1){
    if(class(dataset$data[,i]) == "factor") {
      dataset$data[,i] = as.numeric(dataset$data[,i]);
      flag = TRUE
    }
  }
  if(flag){
    cat("       -> converting features to numeric values. \n")
  } 
  return(dataset)
}

# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------