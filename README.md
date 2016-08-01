# MfeatAnalysis

Meta-features Analysis Experiment ('*MfeatAnalysis*') is a project to extract some meta-features from [OpenML](http://www.openml.org/) datasets. A complete overview of these meta-features can be found in ... This project extracts:

* **Statlog meta-features**: measures originally proposed in the STATLOG Project [1], which contains: simple, statistical, model-based, information-theoretic, landmarking and runtime measures.

* **Data complexity meta-features**: they are complexity measures of classification problems considering, for example, the overlap in the feature values, the separability of classes, and geometric-topological data properties. The documentation of the corresponding library ([DCoL](http://dcol.sourceforge.net/)) [2] give more details about them.

* **Complex Network meta-features**: they are measures extracted from a complex network built in the data instances. More details can be found in [3]. 

### Technical Requirements

* R version >= 3.1.0
* Data Complexity Library in C++ (DCoL): http://dcol.sourceforge.net/ 
* Required packages: [R.utils](https://cran.r-project.org/web/packages/R.utils/index.html),  [CORElearn](https://cran.r-project.org/web/packages/CORElearn/index.html),  [e1071](https://cran.r-project.org/web/packages/e1071/index.html), [FNN](https://cran.r-project.org/web/packages/FNN/index.html), 
[infotheo](https://cran.r-project.org/web/packages/infotheo/index.html), [irr](https://cran.r-project.org/web/packages/irr/index.html), [rpart](https://cran.r-project.org/web/packages/rpart/index.html), [rrcov](https://cran.r-project.org/web/packages/rrcov/index.html),  [igraph](http://igraph.org/r/), [mlr](https://cran.r-project.org/web/packages/mlr/index.html),  [OpenML](https://github.com/openml/openml-r)


### Setup

To install all of the R packages, use the follow command:
```R
install.packages(c("R.utils", "CORElearn", "e1071", "FNN", "infotheo", "irr", "rpart", "rrcov", "igraph"))
```

For the packages *mlr* and *OpenML*, please, use the following commands:

```R
install.packages(c("devtools", "RWeka"))
devtools::install_github("mlr-org/mlr")
devtools::install_github("openml/r")
```

Before start to run the project we need the binary of the DCoL library. Download the code of DCoL Library at http://dcol.sourceforge.net/ and follow the instructions to compile the code in the README file. After that, replace the executable dcol at folder ~/MfeatAnalysis/R/dcol

### Running the code

To run the project, execute it by the command:

```
./run.sh &
```
It will call the bash file and start the execution creating an output log file called '*out-Mfeat.log*'. You can follow 
the execution and errors checking directly the log file.

If you want to run experiments directly through the R script, you can call the command:
````
R CMD BATCH --no-save --no-restore mainFeatureAnalysis.R out-Mfeat.log &
```

Results will be saved in a directory call '*temp*', one per dataset (if exist more than one). A final meta-base csv file will be saved automatically in the project's directory.

### Contact

Rafael Gomes Mantovani (rgmantovani@gmail.com) University of São Paulo - São Carlos, Brazil.

### References

[1] D. Michie, D.J. Spiegelhalter, C.C. Taylor, J. Campbell. Machine Learning, Neural and Statistical Classification, 1994, Ellis Horwood.

[2] A. Orriols-Puig, N. Maciá, T.K. Ho, Documentation for the data complexity library in C++, Tech. rep., La Salle - Universitat Ramon Llull (2010).

[3] L.P.F. Garcia, A.C.P.L.F. de Carvalho, A.C. Lorena. Noise detection in the meta-learning level. Neurocomputing, v.176, 2016, p.14-25.

### Citation

If you use our code/experiments in your research, please, cite [our paper]():

[ADD citation]

### Bibtex 

[ADD bibtex entry]
