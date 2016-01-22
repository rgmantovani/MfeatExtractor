# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# R Code
# DCoL Library
# Ho and Basu 2002; Ho et al. 2006; and Orriols-Puig et al. 2010
# A set of measures designed to characterize the apparent complexity of data sets

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

cxName = function(data) {

	name = paste(".", paste(sample(letters, 20, replace=TRUE), collapse=""), sep="");
	write.arff(data, paste(DIR, "/", name, ".arff", sep=""));
	return(name);
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

cxExecute = function(name) {

	exe = paste(DIR, "/R/dcol/./dcol -i ", DIR, "/", name, ".arff -o ", DIR, "/", name, " -A", sep="");
	system(paste(exe, sep=""), ignore.stdout=TRUE, ignore.stderr=TRUE);
	vet = read.table(paste(DIR, "/", name, ".txt", sep=""), skip=18)[,-1];
	names(vet) = COMPLEX;
	return(vet);	
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

cxReplace = function(name) {

	exe = paste(DIR, "/R/dcol/./dcol -i ", DIR, "/", name, ".arff -o ", DIR, "/", name, " -F 1v -L 1 -L 2 -L 3 -d", sep="");
	system(paste(exe, sep=""), ignore.stdout=TRUE, ignore.stderr=TRUE);
	vet = colMeans(read.table(paste(DIR, "/", name, ".txt", sep=""), skip=8)[,-1]);
	names(vet) = REPLACE;
	return(vet);
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

cxRemove = function(name) {
	system(paste("rm ", DIR, "/", name, ".* ", sep=""));
}

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

getDataComplexFeatures = function(data) {

	name = cxName(data);
	dcol = cxExecute(name);
	if(nlevels(data$Class) > 2){
		dcol[,REPLACE] = cxReplace(name);
	}

	cxRemove(name);
	return(as.numeric(dcol));
}


# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------