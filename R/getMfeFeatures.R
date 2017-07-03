# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getMfeFeatures = function(data) {

  cat("   - mfe general features \n")
  general = tryCatch({
    unlist(mfe::mf.general(formula = as.formula("Class ~ ."), data = data))
  }, error = function(err) {
    cat("    * got some error - handling with NAs ... \n")
    return(numeric(0))
  })

  cat("   - mfe statistical features \n")
  statistical = tryCatch({
    unlist(mfe::mf.statistical(formula = as.formula("Class ~ ."), data = data))
 }, error = function(err) {
    cat("    * got some error - handling with NAs ... \n")
    return(numeric(0))
  })

  cat("   - mfe model based features \n")
  model.based = tryCatch({
    unlist(mfe::mf.model.based(formula = as.formula("Class ~ ."), data = data))
  }, error = function(err) {
    cat("    * got some error - handling with NAs ... \n")
    return(numeric(0))
  })

  cat("   - mfe info theo features \n")
  infotheo = tryCatch({
    unlist(mfe::mf.infotheo(formula = as.formula("Class ~ ."), data = data))
  }, error = function(err) {
    cat("    * got some error - handling with NAs ... \n")
    return(numeric(0))
  })

  cat("   - mfe discriminant features \n")
  discriminant = tryCatch({
    unlist(mfe::mf.discriminant(formula = as.formula("Class ~ ."), data = data))
 }, error = function(err) {
    cat("    * got some error - handling with NAs ... \n")
    return(numeric(0))
  })

  cat("   - mfe landmarking features \n")
  landmarking = tryCatch({
    unlist(mfe::mf.landmarking(formula = as.formula("Class ~ ."), data = data))
  }, error = function(err) {
    cat("    * got some error - handling with NAs ... \n")
    return(numeric(0))
  })

  # final output
  obj = list(general = general, statistical = statistical, model.based = model.based, 
    infotheo = infotheo, discriminant = discriminant, landmarking = landmarking)

  return(obj)
}
 
# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
