# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

  devtools::load_all()

  unlink("test-files/", recursive = TRUE)
  reg = makeExperimentRegistry(
    id = "test", 
    packages = c("ParamHelpers", "mlr", "OpenML"), 
    src.dirs = "R/"
  )

  if(!dir.exists("temp")) {
    dir.create("temp", recursive = TRUE)
  } else {
    warning(" - TEMP dir already exists.\n")
  }

  # For testing purporses
  data.ids = getTaggedDatasets(tag = "study_14")
  data.ids = setdiff(data.ids, REMOVE.DATA)[1:3]

  # Creating new jobs
  new.jobs = batchmark(reg = reg, data.id = data.ids, overwrite = TRUE)
  
  # Checking if is the first submission
  if( length(findDone(reg)) == 0 ) {
    catf(" * First execution of the experiments ...")
  } else {
    catf(" * There are remaining jobs or new ones ...")
  }
 
  # # # Running what is not done
  all.jobs = setdiff(findNotDone(reg), findErrors(reg))
  print(all.jobs)

   # testJob(reg = reg, id = job)
 
  catf(" * Submitting all jobs ...")
  submitJobs(
    reg = reg, 
    ids = all.jobs, 
    resources = list(memory = 8 * 1024, walltime = 3600 * 8),
    job.delay = TRUE
  )
  
  status = waitForJobs(reg = reg, ids = all.jobs)
  catf(" * Done.")

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------