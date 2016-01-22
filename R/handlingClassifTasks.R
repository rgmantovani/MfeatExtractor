# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

handlingClassifTasks = function (oml.tasks) {

  originals.dir = "data/originals"
  if(!dir.exists(originals.dir)) {
    dir.create(originals.dir, recursive = TRUE)
  }

  preprocessed.dir = "data/preprocessed" 
  if(!dir.exists(preprocessed.dir)) {
    dir.create(preprocessed.dir, recursive = TRUE)
  }

  aux = lapply(oml.tasks, function(oml.task.id) {
    
    task = getOMLTask(task.id = oml.task.id)
    task.data = task$input$data.set$data
    task.name = task$input$data.set$desc$name
    
    original.file = paste0(originals.dir, "/", task$task.id, "-", task.name, ".arff")
    if(!file.exists(original.file)) {
      write.arff(x = task.data, file = original.file)
    }

    
    preprocessed.file = paste0(preprocessed.dir, "/", task$task.id, "-", task.name, ".arff")
    if(!file.exists(preprocessed.file)) {

    }

    mlr.obj = convertOMLTaskToMlr(task)
    mlr.obj$mlr.rin$desc$stratify = TRUE
    measures = mlr.obj$mlr.measures    
    
  })

}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------