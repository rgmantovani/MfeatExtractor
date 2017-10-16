# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# runSeveralFiles = function() {

#   devtools::load_all()
#   all.files = list.files("data/datasets/")
#   option = "mfe"
#   # all.files = c("13_breast-cancer", "1037_ada_prior")
#   files =  gsub(x = all.files, pattern=".arff", replacement="")

#   for(datafile in files) {

#     cat(" ---------------------------- \n")
#     cat(paste0(" - Datafile: \t", datafile, "\n"))
#     cat(paste0(" - Features: \t", option, "\n"))
#     runExtraction(datafile = datafile, option = option)    
 
#   }
  
#   cat("* Finished!\n")
#   cat(" ---------------------------- \n")

# }

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# runSingleDataset = function() {

  # *** checking functions individually ***
  devtools::load_all()
  datafile = "13_breast-cancer"
  # datafile = "seq_target_92"
  # option   = "stat"

  data = RWeka::read.arff(file = paste0("data/datasets/", datafile, ".arff"))
  pre.data = preProcessing(data = data)
  # mfe.feat = getMfeFeatures(data = data)
 
  # comp     = getCompFeatures(data = pre.data)
  # cnet     = getCnetFeatures(data = data)
  # pca.feat = getPCAFeatures(data = pre.data)
  # stat = getStatlogFeatures(data = data)

  runExtraction(datafile = datafile)
  
# }
# 
# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

#runSeveralFiles()
 # runSingleDataset()


# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
