# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------

printDatasetInfo = function(dataset) {
 
  catf(" =========================== ")
  catf(" * Data info: ")
  catf(" =========================== ")
  cat("   # dataset id:  ", dataset$desc$id, "\n")
  cat("   # dataset name:", dataset$desc$name, "\n")
  cat("   # features:    ", (ncol(dataset$data)-1), "\n")
  cat("   # instances:   ", nrow(dataset$data), "\n")
  cat("   # classes:     ", length(levels(dataset$data[, dataset$target.features])), "\n")
  cat("   # missing:     ", any(is.na(dataset$data)), "\n")
  catf(" =========================== ")
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