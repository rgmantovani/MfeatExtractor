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

  if(any(is.na(dataset$data))) {
    catf("   - Data imputation required ...")
    temp = impute(obj = dataset$data, classes = list(numeric = imputeMean(), factor = imputeMode()))
    dataset$data = temp$data
  }
  
  # mlr removing constant features
  task = makeClassifTask(data = dataset$data, target = dataset$target.features)
  task = removeConstantFeatures(task)
  
  # task = normalizeFeatures(task, method = "standardize", exclude = character(0L), range = c(0, 1), 
    # on.constant = "quiet")
  dataset$data = task$env$data

  return(dataset)
}

# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------