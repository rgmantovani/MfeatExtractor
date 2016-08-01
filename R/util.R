# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------

printDatasetInfo = function(dataset) {
 
  catf(" * Data info: ")
  cat("   - Dataset id:",dataset$desc$id, "\n")
  cat("   - Dataset name:",dataset$desc$name, "\n")
  cat("   - nFeatures: ",(ncol(dataset$data)-1), "\n")
  cat("   - nExamples: ",nrow(dataset$data), "\n")
  cat("   - nClasses: ",length(levels(dataset$data[, dataset$target.features])), "\n")
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