# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

mainExtraction = function(datafile, option) {

  devtools::load_all()

  sub.data = gsub(x = list.files(path = "data/datasets/"), pattern = ".arff", replacement = "")
  assertChoice(x = datafile, choices = sub.data, .var.name = "datafile")
  assertChoice(x = option, choices = c("mfe", "cnet", "comp", "pca", "all", "stat"))

  cat(" ---------------------------- \n")
  cat(" ** Meta-features extractor ** \n")
  cat(" ---------------------------- \n")

  cat(paste0(" - Datafile: \t", datafile, "\n"))
  cat(paste0(" - Features: \t", option, "\n"))
  cat(" ---------------------------- \n")

  runExtraction(datafile = datafile, option = option)

  cat("\n - Finished!\n")
  cat(" ---------------------------- \n")
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# parsing main call
options(echo = TRUE) 
args = commandArgs(trailingOnly = TRUE)

# Parse arguments (we expect the form --arg=value)
parseArgs = function(x) strsplit(sub("^--", "", x), "=")
argsDF = as.data.frame(do.call("rbind", parseArgs(args)))
argsL = as.list(as.character(argsDF$V2))

# Calling execution with the arguments
mainExtraction(datafile = argsL[[1]], option = argsL[[2]])

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------