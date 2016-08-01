# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

runningExtraction = function() {

  if(!dir.exists("temp")) {
    dir.create("temp", recursive = TRUE)
  } else {
    cat(" - TEMP dir already exists.\n")
  }

  # Getting Datasets Ids
  oml.data.ids = getTaggedDatasets(tag = "study_14")
 

  aux = lapply(1:length(oml.data.ids), function(i){

    catf(" ----------------------------- ")
    id = oml.data.ids[i]
    cat(" * ", i, "/", length(oml.data.ids) ," - OML Dataset: \n")
    dataset = tryCatch({
      getOMLDataSet(did = id)
    }, error = function(e) {
      cat("Error: dataset ", id, "is inactive!\n")
      NULL
    })

    if(!is.null(dataset)) {

      printDatasetInfo(dataset)
      nexamp = nrow(dataset$data)
      if(nexamp > 60000 || nexamp < 100) {
        catf("   - Skipping for now: too few or too much examples")
        catf(" ----------------------------- ")
        return (NULL)
      }

      dataset.dir = paste0("temp/", dataset$desc$id, "_", dataset$desc$name)
      if(!dir.exists(dataset.dir)) {
        dir.create(dataset.dir, recursive = TRUE)
      }

      dataset = dataStandardization(dataset)
      dataset = dataPreprocessing(dataset)
      
      # which measures should extract ?
      all = getMetaFeatures(
        dataset = dataset, 
        statlog = TRUE, 
        complex = TRUE, 
        network = FALSE # do not extract complex features
      )

      obj = list(name = dataset$desc$name, feat = all)
      return(obj)
    }
    return(NULL)
  })
  
  meta.features = data.frame(do.call("rbind", lapply(aux, function(elem){elem$feat})))

  names = do.call("rbind", lapply(aux, function(elem){elem$name}))
  df2 = data.frame(cbind(oml.data.ids, names))
  colnames(df2) = c("dataset.id", "dataset.name")

  metabase = cbind(df2,meta.features)
  output.filename = paste0("meta_base_",nrow(metabase),"_datasets_", (ncol(metabase)-2), "_features")

  catf(" ----------------------------- ")
  catf(" * Saving metabase with: ")
  cat(paste0("  - datasets: ", nrow(metabase), "\n"))
  cat(paste0("  - meta-features:", (ncol(metabase)-2), "\n"))

  save("metabase", file = paste0(output.filename,".RData"))
  write.csv(metabase, file = paste0(output.filename,".csv"))

  catf(" ----------------------------- ")
  catf(" End of execution !")
  catf(" ----------------------------- ")
  
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
