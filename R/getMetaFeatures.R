# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------

getMetaFeatures = function(dataset) {

  comp = getDataComplexMetaFeatures(dataset)
  all  = statlogFeatures(dataset) 
	
  aux = c( all, comp)
	names(aux) = c(CHARACTERIZATION, COMPLEX)

	return(aux)
}

# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------