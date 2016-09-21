# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------

dataStandardization = function(dataset) {

  catf(" * Data Standardization:")
  cl.id = which(colnames(dataset$data) == dataset$target.features)
  if(cl.id != ncol(dataset$data)) {
    cat("   - Changing class attribute to be the last one ...\n")
    dataset$data = cbind(dataset$data[ ,-cl.id], dataset$data[,cl.id])
  }

  cat("   - Renaming class attribute as *Class* ...\n")
  colnames(dataset$data)[ncol(dataset$data)] = "Class"
  dataset$target.features = "Class"
  
  if(class(dataset$data$Class) != "factor"){
    cat("   - Class must be a factor ... \n")
    dataset$data$Class = as.factor(as.character(dataset$data$Class))  
  }
  
  return(dataset)
}

# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
 
removeConsFeat = function(dataset) {
  uniquelength = sapply(dataset$data, function(x) length(unique(x)))
  dataset$data = subset(dataset$data, select = uniquelength > 1)
  return (dataset)
}

# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------

dataPreprocessing = function(dataset){

  catf(" * Preprocessing data:")
  dataset = removeConsFeat(dataset)

  catf("   - Data imputation required ... \n")
  temp = impute(
    obj = dataset$data, 
    classes = list(numeric = imputeMedian(), factor = imputeMode()),
    dummy.classes = c("numeric", "factor")
  )
  
  dataset$data = temp$data
  return(dataset)
}

# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------

puttingInStandard = function(dataset){
  
  for(i in 1:(ncol(dataset$data))-1){
    if(class(dataset$data[,i]) == "factor") {
      dataset$data[,i] = as.numeric(dataset$data[,i])
    }
  }
  return(dataset)
}

# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
