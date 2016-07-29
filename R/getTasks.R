# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

gettingActiveOMLTasks = function() {

  tasks = listOMLTasks(status = "active")

  tasks.ids = which(tasks$task_type == "Supervised Classification"	 
    & tasks$estimation_procedure == "10-fold Crossvalidation"
    & tasks$NumberOfInstances >= 100 
    & tasks$NumberOfInstances <= 100000
    & tasks$NumberOfMissingValues == 0)

  sel.tasks = tasks[tasks.ids, ]
  
  sel.tasks$dims = sel.tasks$NumberOfInstances * sel.tasks$NumberOfFeatures
  sel.tasks = sel.tasks[ order(sel.tasks$dims, decreasing = FALSE), ]

  # remove big datasets
  sel.tasks = sel.tasks[sel.tasks$dims < 10^6,]

  # tasks with errors
  remove = c(3509, 3508, 8)
  ret = setdiff(sel.tasks$task_id, remove)

  return (ret)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getTaggedTasks = function(tag) {

  tasks = listOMLTasks(tag = tag)
  tasks$dim = tasks$NumberOfInstances * tasks$NumberOfFeatures
  tasks = tasks[ order(tasks$dim, decreasing = FALSE), ]

  return(tasks$task.id)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
