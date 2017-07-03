# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# lists all datasets in mfeat dir binding mfeats into a data frame object
# return it and save at the disk

joinMfeats = function() {

  feat.sets = c("dataCompFeatures", "compNetFeatures", "pcaFeatures", "mfeFeatures")

  data.files = list.files(path = "mfeats/")

  aux = lapply(data.files, function(dataset) {

    print(dataset)
        
    inner.aux = lapply(feat.sets, function(feat.file) {

      set = paste0("mfeats/", dataset, "/", feat.file, ".RData")
      if(!file.exists(set)) {
        return(NULL)
      } else {
        print(set)
        ret = get(load(set, verbose = FALSE))
        if(class(ret) == "list") {
          feat.aux = lapply(names(ret), function(elem) {
            values = get(elem, ret)
            names(values) = paste(elem, names(values), sep=".")
            return(values)
          })
          return(Reduce(c, feat.aux))
        }
        return(ret)
      }

    })
    meta.example = data.frame(t(unlist(Reduce(c, inner.aux))))
    return(meta.example)   
  })

  # binding all meta-features
  df = plyr::rbind.fill(aux)
  df = cbind(data.files, df)

  d = nrow(df)
  c = ncol(df)-1
 
  write.csv(x = df, file = paste0("mfeatures_",d,"_data_",c,"_feat.csv"))
  save(df, file = paste0("mfeatures_",d,"_data_",c,"_feat.RData"))

}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

joinMfeats()

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
