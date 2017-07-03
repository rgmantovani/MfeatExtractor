# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getMfeFeatures = function(data) {

  cat("   - mfe general features \n")
  general = tryCatch({
    unlist(mfe::mf.general(formula = as.formula("Class ~ ."), data = data))
  }, error = function(err) {
    cat(" * got some error - handling with NAs ... \n")
    ext = rep(NA, times=length(mfe::ls.general()))
    names(ext) = mfe::ls.general()
    return(ext)
  })

  cat("   - mfe statistical features \n")
  statistical = tryCatch({
    unlist(mfe::mf.statistical(formula = as.formula("Class ~ ."), data = data))
  }, error = function(err) {
    cat(" * got some error - handling with NAs ... \n")
    ext = rep(NA, times=length(mfe::ls.statistical()))
    names(ext) = mfe::ls.statistical()
    return(ext)
  })

  cat("   - mfe model based features \n")
  model.based = tryCatch({
    unlist(mfe::mf.model.based(formula = as.formula("Class ~ ."), data = data))
  }, error = function(err) {
    cat(" * got some error - handling with NAs ... \n")
    ext = rep(NA, times=length(mfe::ls.model.based()))
    names(ext) = mfe::ls.model.based()
    return(ext)
  })

  cat("   - mfe info theo features \n")
  infotheo = tryCatch({
    unlist(mfe::mf.infotheo(formula = as.formula("Class ~ ."), data = data))
  }, error = function(err) {
    cat(" * got some error - handling with NAs ... \n")
    ext = rep(NA, times=length(mfe::ls.infotheo()))
    names(ext) = mfe::ls.infotheo()
    return(ext)
  })

  cat("   - mfe discriminant features \n")
  discriminant = tryCatch({
    unlist(mfe::mf.discriminant(formula = as.formula("Class ~ ."), data = data))
  }, error = function(err) {
    cat(" * got some error - handling with NAs ... \n")
    ext = rep(NA, times=length(mfe::ls.discriminant()))
    names(ext) = mfe::ls.discriminant()
    return(ext)
  })

  cat("   - mfe landmarking features \n")
  landmarking = tryCatch({
    unlist(mfe::mf.landmarking(formula = as.formula("Class ~ ."), data = data))
  }, error = function(err) {
    cat(" * got some error - handling with NAs ... \n")
    ext = rep(NA, times=length(mfe::ls.landmarking()))
    names(ext) = mfe::ls.landmarking()
    return(ext)
  })

  # final output
  obj = list(general = general, statistical = statistical, model.based = model.based, 
    infotheo = infotheo, discriminant = discriminant, landmarking = landmarking)

  return(obj)
}
 
# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
