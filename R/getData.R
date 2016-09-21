# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getTaggedDatasets = function(tag) {

  datasets = listOMLDataSets(tag = tag)
  datasets$dim = datasets$NumberOfInstances * datasets$NumberOfFeatures
  datasets = datasets[ order(datasets$dim, decreasing = FALSE), ]

  return(datasets$data.id)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
