# MfeatExtractor

Meta-features Extractor ('*MfeatExtractor*') is an automated code to extract meta-features from classification datasets. The current version convers the following set of data descriptors:

* **Statlog meta-features (STAT)**: measures originally proposed in the STATLOG Project [1], which contains: simple, statistical, model-based, information-theoretic, landmarking and runtime measures. They are extracted via [mfe](https://cran.r-project.org/package=mfe) R package [4].

* **Data complexity meta-features (COMP)**: complexity measures of classification problems considering, for example, the overlap in the feature values, the separability of classes, and geometric-topological data properties. The documentation of the corresponding library ([DCoL](http://dcol.sourceforge.net/)) [2] give more details about them.

* **Complex Network meta-features (CNET)**: measures extracted from a complex network built in the data instances. More details can be found in [3]. 

* **PCA meta-features (PCA)**: PCA-based meta-features, extracted via ... (**give more details**), and originally proposed in [5].

### Technical Requirements

* R version >= 3.1.0
* Data Complexity Library in C++ (DCoL): http://dcol.sourceforge.net/ 

### Setup

Istalling it ...

```R
devtools::install_github("rgmantovani/MfeatExtractor")
```

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

[4] Add Adriano package ref

[5] Add Tomas paper ref


### Add custom Citation

If you use our code/experiments in your research, please, cite [our paper]() where it was firstly used :

[ADD citation]

### Add custom Bibtex 

[ADD bibtex entry]
