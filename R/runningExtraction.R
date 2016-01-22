# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

runningExtraction = function() {

  # Saving temporary results
  if(!dir.exists("temp")) {
    dir.create("temp", recursive = TRUE)
  }

  oml.data.ids = gettingOMLDataIds()
 
  catf(" ----------------------------- ")
  n = length(oml.data.ids)
  aux = lapply(1:n, function(i){

    id = oml.data.ids[i]
    cat(" * ", i, "/", n ," - OML Dataset: \n")
    dataset = tryCatch({
      getOMLDataSet(did = id)
    }, error = function(e) {
      cat("Error: dataset ", id, "is inactive!\n")
      NULL
    })

    if(!is.null(dataset)) {
      
      if(nrow(dataset$data) > 10000) {
        catf("   - Skipping for now.")
	      return(NULL)
      }
    
      obj = NULL
      filename = paste0("temp/", dataset$desc$id, "_", dataset$desc$name, ".RData")
      if(!file.exists(filename)) {

        dataset.dir = paste0("temp/", dataset$desc$id, "_", dataset$desc$name)
        if(!dir.exists(dataset.dir)) {
          dir.create(dataset.dir, recursive = TRUE)
        }

        #Put data in the required standard
        dataset = dataStandardization(dataset)
        printDatasetInto(dataset)

        #data preprocessing step (imputation, etc)
        dataset = dataPreprocessing(dataset)
        all = getMetaFeatures(dataset)
        
        # unlink(dataset.dir, recursive = TRUE)
        obj = list(id=dataset$desc$id, name=dataset$desc$name, features=all)
        save(obj, file = filename)
        obj = NULL
      } else {
        cat(" - Features already extracted. \n")
        catf(" ----------------------------- ")
        temp = load(filename)
        return(obj)
      }
  
      catf(" ----------------------------- ")
      return(obj)
    
    }
    catf(" ----------------------------- ")
    return(NULL)
  
  })

  feat = as.data.frame(do.call("rbind", lapply(aux, function(elem){elem$features})))
  ids = do.call("rbind", lapply(aux, function(elem){elem$id}))
  names = do.call("rbind", lapply(aux, function(elem){elem$name}))
  temp = cbind(ids, names, feat)
  colnames(temp) = c("dataset.id", "dataset.name", STAT, COMPLEX) #, CNET)
 
  cat(" - Exporting meta-dataset. \n")
  save("temp", file="meta_features.RData")
  write.csv(temp, file="meta_features.csv")
  
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
