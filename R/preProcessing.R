#--------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------
# This function preprocess a dataset in order to extract some kind of meta-features. 
# The following transformations are applied :
#   - remove constant attributes
#   - rename categorical attributes
#   - normalize all attribues (mean=0, std=1), but Class
#   - remove duplicate examples
#   - format file header
#--------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------

preProcessing = function(data) {

  if(any(is.na(data))) {
    imp = mlr::impute(obj = data, target = "Class", 
      classes = list(integer = mlr::imputeMedian(), factor = mlr::imputeConstant(const = "New"), 
      numeric = mlr::imputeMedian())
    )
    data = imp$data
  }

  class.id = which(colnames(data) == "Class")
  class = data[, class.id]
  data  = data[,-class.id]

  # remove constant attributes
  for(i in colnames(data)) {  
    
    # categorical attributes
    if(is.factor(data[,i])) {
        
      if(nlevels(data[,i]) == 1 || nlevels(data[,i]) == nrow(data)) {
        data[,i] = NULL
      } else {
        data[,i] = factor(data[,i])
        levels(data[,i]) = factor(1:length(levels(data[,i])))
      }
      
    # numeric attributes  
     } else {
      if(sd(data[,i]) == 0) {
        data[,i] = NULL
      } else {
        data[,i] = RSNNS::normalizeData(data[,i], type="norm")
      }
    }
  }

  data = cbind(data, class)

  # remove duplicated examples
  aux = which(duplicated(data))
  if(length(aux) != 0){
    data = data[-aux,]
  }

  # format the header
  colnames(data)[ncol(data)] = "Class"
  data$Class = factor(data$Class)
  rownames(data) = NULL

  return(data)
}

#--------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------