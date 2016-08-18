# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getBatchDataWrapper = function(data.id) {
  
  dataset = tryCatch({
      cat("Getting OML Dataset: ", data.id, "\n")
      getOMLDataSet(did = data.id)
    }, error = function(e) {
     cat("Error: dataset ", data.id, "is inactive!\n")
     NULL
  })

   # Standardazing the data
  dataset = dataStandardization(dataset)

  if( any(is.na(dataset$data)) ){
    dataset = dataPreprocessing(dataset = dataset)
  }
  
  return(dataset)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
