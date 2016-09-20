# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getBatchDataWrapper = function(data.id) {
 
  dataset = try(getOMLDataSet(data.id = data.id), silent = TRUE)
  if (inherits(task, "try-error")) {
    setOMLConfig(arff.reader = "RWeka")
    dataset = getOMLDataSet(data.id = data.id)
    setOMLConfig(arff.reader = "farff")
  }

   # Standardazing the data
  dataset = dataStandardization(dataset)

  if( any(is.na(dataset$data)) ){
    dataset = dataPreprocessing(dataset = dataset)
  }
  
  return(dataset)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
