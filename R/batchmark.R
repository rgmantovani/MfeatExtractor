# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

batchmark = function(reg, data.id, overwrite = FALSE) {
  
  BatchExperiments:::checkExperimentRegistry(reg = reg)
  
  if ( any(c("mlr", "OpenML") %nin% names(reg$packages)) ) {
    stop("\'mlr\' and \'OpenML\' are required on the slaves, please add them via 'addRegistryPackages'")
  }
  assertFlag(overwrite)

  # Adding problems (tasks)
  problem.designs = Map(
    f = function(id, data.id, seed) {
      static = list(dataset = getBatchDataWrapper(data.id))
      addProblem(reg = reg, id = id, static = static, overwrite = overwrite, seed = seed)
      makeDesign(id = id)
    }, 
    id = paste0("OpenML_Data_", data.id), 
    data.id = data.id,
    seed = reg$seed + seq_along(data.id)
  )
  
  algorithm.designs = Map(
    f = function(id, learner) {
      apply.fun = getBatchAlgoWrapper(extract.statlog = GET.STATLOG, extract.complex = GET.COMPLEX, 
        extract.network = GET.NETWORK)
      addAlgorithm(reg = reg, id = id, fun = apply.fun, overwrite = overwrite)
      makeDesign(id = id)
    },
    id = "mfeat" # 
  )

  # Creating jobs
  job.ids = addExperiments(reg = reg, prob.designs = problem.designs, 
    algo.designs = algorithm.designs, repls = 1, skip.defined = TRUE)

  return (job.ids)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------