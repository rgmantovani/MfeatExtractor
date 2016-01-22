# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

  devtools::load_all()

  if(!dir.exists("temp")) {
    dir.create("temp", recursive = TRUE)
  }

  oml.data.ids = gettingOMLDataIds()#[300:517]
 
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
    
      # Just for tests
      # nfeat = ncol(dataset$data)
      # nexamp = nrow(dataset$data)
      # if(nfeat > 100 || nexamp > 10000) {
      #   catf("   - skipping for now ")
      #   catf(" ----------------------------- ")
      #   return (NULL)
      # }

      obj = NULL
      filename = paste0("temp/", dataset$desc$id, "_", dataset$desc$name, ".RData")
      if(!file.exists(filename)) {

        dataset.dir = paste0("temp/", dataset$desc$id, "_", dataset$desc$name)
        if(!dir.exists(dataset.dir)) {
          dir.create(dataset.dir, recursive = TRUE)
        }

        dataset = dataStandardization(dataset)
        printDatasetInto(dataset)
        dataset = dataPreprocessing(dataset)
            
        cat(" * Getting features ... \n")

        cat("       -> Statlog features ... \n")
        stat.file = paste0(dataset.dir, "/statlogFeatures.RData")
        if(!file.exists(stat.file)) {
          stat = getStatlogFeatures(dataset$data)
          save(stat, file = stat.file)
        }else{
          temp = load(stat.file)
        }
       
        cat("       -> Data complexity features ... \n")
        comp.file = paste0(dataset.dir, "/dataCompFeatures.RData")
        if(!file.exists(comp.file)) {
          comp = getDataComplexFeatures(dataset$data)
          save(comp, file = comp.file)
        }else{
          temp = load(comp.file)
        }

        # cat("       -> Complex networks features ... \n")
        # cnet.file = paste0(dataset.dir, "/compNetFeatures.RData")
        # if(!file.exists(cnet.file)) {
        #   cnet = getCompNetworkFeatures(dataset$data, epson = 0.15)
        #   save(cnet, file = cnet.file)
        # }else{
        #   temp = load(cnet.file)
        # }

        all = c(stat, comp) #, cnet)
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
 
  save("temp", file="meta_features.RData")
  write.csv(temp, file="meta_features.csv")


# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# all.avail.tasks = gettingActiveOMLTasks()
# oml.task.id = all.avail.tasks[1]
# task = getOMLTask(task.id = oml.task.id)
# task.id = task$task.id
# task.data = task$input$data.set$data
# task.name = task$input$data.set$desc$name
# task.target = task$input$data.set$target.features

# mlr.obj = convertOMLTaskToMlr(task)
# mlr.task = mlr.obj$mlr.task


# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------