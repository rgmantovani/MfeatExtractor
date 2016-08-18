# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# R Code
# Network Metrics
# L. P. Garcia, A. C.P.L.F. Carvalho, A. C. Lorena 2014
# Measures based on complexity network analysis

# Please cite:
# Luís P.F. Garcia, André C.P.L.F. de Carvalho, Ana C. Lorena. Effect of label noise in the
# complexity of classification problems. Neurocomputing, v 160 (2015). 108 - 119.

# Requires: igraph R package

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

basic = function(graph) {

	edge = igraph::ecount(graph)
	rate = mean(igraph::degree(graph))
	aux  = c(edge, rate)
	return(aux)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

density = function(graph) {

	aux = igraph::graph.density(graph)
	return(aux)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

componets = function(graph) {

	tmp = igraph::clusters(graph, mode = "weak")
	aux = max(tmp$csize)
	return(aux)        
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

centrality = function(graph) {

	aux = mean(igraph::closeness(graph))
	return(aux)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

between = function(graph) {

	aux = mean(igraph::betweenness(graph))
	return(aux)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

hub = function(graph) {

	aux = mean(igraph::hub.score(graph)$vector)
	return(aux)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

giantComponent = function(graph) {

	cls = igraph::clusters(graph)
	aux = igraph::induced.subgraph(graph, which(cls$membership == which.max(cls$csize)))
	return(aux)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

clusterCof = function(graph) {

	g = giantComponent(graph)
	disthist = igraph::path.length.hist(g, directed = FALSE)$res

	if(length(disthist) == 0) {
		avg = 0
	} else {
		avg = weighted.mean(1:length(disthist), disthist)
	}

	cof = igraph::transitivity(graph, type = "undirected")
	aux = c(cof, avg)
	return(aux)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

ennSup = function(data, epson) {

	dst = as.matrix(dist(data[,-ncol(data)], method = "minkowski"))
	aux = matrix(0, nrow(data), nrow(data), dimnames = list(rownames(data), rownames(data)))

	for(i in 1:nrow(aux)) {
		
		tmp1 = names(sort(dst[i,])[1:(epson*nrow(data))+1])
		tmp2 = rownames(data[data$Class == data[i,]$Class,])
		tmp3 = intersect(tmp1, tmp2)
		aux[i, tmp3] = 1
	}

	return(aux)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getCompNetworkFeatures = function(data, epson) {

	aux = ennSup(data, epson)
	graph = igraph::graph.adjacency(aux, mode = "undirected")
	tmp = c(basic(graph), density(graph), componets(graph), centrality(graph), between(graph), 
		hub(graph), clusterCof(graph))
	
	return(tmp)
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------