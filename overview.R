# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# returns an overview of all datasets existing in the mfeat directory, and indicating
# which categories of mfeat were already extracted
# returns a data frame, and save the csv file

overview = function() {

  data.files = list.files(path = "mfeats/")

  aux = lapply(data.files, function(dataset) {

    inner.files = list.files(path = paste0("mfeats/", dataset), full.names = TRUE)

    comp = any(grepl("dataCompFeatures", inner.files))
    cnet = any(grepl("compNetFeatures", inner.files))
    pca  = any(grepl("pcaFeatures", inner.files))
    mfe  = any(grepl("mfeFeatures", inner.files))

    ret = c(mfe, comp, cnet, pca)
    names(ret) = c("mfe", "comp", "cnet", "pca")

    #TODO: check mfe categories also
    return(ret)
  })

  df = data.frame(do.call("rbind", aux))
  df = cbind(data.files, df)
  print(df)
  write.csv(x = df, file = "overview.csv")

}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

overview()

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
