# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------

printDatasetInto = function(dataset) {
 
  catf(" * Data info: ")
  cat("   - Dataset id:", dataset$desc$id, "\n")
  cat("   - Dataset name:", dataset$desc$name, "\n")
  cat("   - nFeatures: ", (ncol(dataset$data)-1), "\n")
  cat("   - nExamples: ", nrow(dataset$data), "\n")
  cat("   - nClasses: ", length(levels(dataset$data$Class)), "\n")
  
  # if(length(levels(dataset$data$Class)) == 0 ){
    # stop()
  # }

}

# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------