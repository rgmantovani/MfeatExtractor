# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getBatchAlgoWrapper = function(extract.statlog, extract.complex, extract.network) {
  
  function(job, static, dynamic) {
    # Show data information
    temp.data = static$dataset
    printDatasetInfo(temp.data)
      
    # create temp dir with the features
    dataset.dir = paste0("temp/", temp.data$desc$id, "_", temp.data$desc$name)
    if(!dir.exists(dataset.dir)) {
      dir.create(dataset.dir, recursive = TRUE)
    }

    # which measures should extract ?
    res = getMetaFeatures(
      dataset = temp.data, 
      statlog = extract.statlog, 
      complex = extract.complex, 
      network = extract.network
    )
   
    return(res)
  }
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
