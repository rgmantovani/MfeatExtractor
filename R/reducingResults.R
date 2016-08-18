# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

reducingResults = function(reg){

  # Creating meta level output dir
  if(!dir.exists("output/")) {
    dir.create(path = "output/", recursive = TRUE)
  }

  #information about the extraction (time needed to run the script)
  df = getJobInfo(reg, ids = findDone(reg))

  feat = BatchJobs::reduceResultsDataFrame(reg = reg, ids = findDone(reg))
  ret = cbind(df$prob, feat)
  sub = ret[, which(colnames(feat) %nin% REMOVE)]


  # write.csv with the output/RData
  output.file = paste0("mfeat_", ncol(sub),"_features_", nrow(sub), "_datasets")
  write.csv(x = ret, file = paste0("output/", output.file, ".csv"))
  save(x = ret, file = paste0("output/", output.file, ".RData"))

}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
