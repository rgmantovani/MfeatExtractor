# MfeatExtractor

Meta-features Extractor ('*MfeatExtractor*') is an automated code to extract meta-features from **classification** datasets. The current version covers the following set of data descriptors:

* **Statlog meta-features (STAT)**: measures originally proposed in the STATLOG Project [01], which contains: simple, statistical, model-based, information-theoretic, landmarking and runtime measures. They are extracted via [mfe](https://cran.r-project.org/package=mfe) R package [02].

* **Data complexity meta-features (COMP)**: complexity measures of classification problems considering, for example, the overlap in the feature values, the separability of classes, and geometric-topological data properties. The documentation of the corresponding library ([DCoL](http://dcol.sourceforge.net/)) [03] give more details about them.

* **Complex Network meta-features (CNET)**: measures extracted from a complex network built in the data instances. More details can be found in [04]. 

* **PCA meta-features (PCA)**: meta-features extracted via a simple PCA process, and originally explored for Data Streams in [05].

### Technical Requirements

* R version >= 3.1.0
* Data Complexity Library in C++ (DCoL): http://dcol.sourceforge.net/ 

### Setup

First, download and compile the [DCol](http://dcol.sourceforge.net/) library and place the resultant binary file (dcol) into the ```src``` subdirectory. If the ```src``` folder does not exist, create it, and save the binary file there. This binary will be used to compute *data complexity* meta-features.

The current code depends on the *mfe* package branch ```direct```. Installing it via R is possible through the command:
```R
devtools::install_github("rivolli/mfe", ref="direct")
```
Then, after this requirements are satisfied, please install this projects via:
```R
devtools::install_github("rgmantovani/MfeatExtractor")
```

### Running the code

Running a single job is possible via the command:
```R
R CMD BATCH --no-save --no-restore '--args' --datafile=<datafile> --option=<option> mainExtraction.R out.log &

# For example:
# R CMD BATCH --no-save --no-restore '--args' --datafile="iris" --option="all" mainExtraction.R out.log &
```

It will call the extraction fot the ```<datafile>``` specifying with features should be extracted (```option```). Datafile must be any valid dataset arff file placed at the ```data/datasets/``` sub-directory. It the folder does not exist, please, create one, and place your files in it. The available choices for the ```options```parameter are:
* ```"mfe"``` :  extracts all meta-features from *mfe* package;
* ```"comp"```: extracts all the data complexity meta-features;
* ```"cnet"```: extracts all the complex-network-based meta-features;
* ```"pca"``` : extracts all the pca-based meta-features.

The resultant files will be stored and saved at the ```mfeats``` sub-directory, generating one sub-folder per dataset.

### Joining results and having an overview

We also provide two scripts. One of them returns an overview of the meta-features already extracted from datasets placed at the ```data/datasets/```sub directory:

```
Rscript overview.R &
```
The second will join all the available meta-features and returns a data.frame:

```
Rscript joinMfeats.R &
```

### Contact

Rafael Gomes Mantovani (rgmantovani@gmail.com) University of São Paulo - São Carlos, Brazil.

### References

[01] D. Michie, D.J. Spiegelhalter, C.C. Taylor, J. Campbell. Machine Learning, Neural and Statistical Classification, 1994, Ellis Horwood.

[02] Rivolli, A., Garcia, L. P. F., de Carvalho, A. C. P. L. F. (2017). mfe: Meta-Feature Extractor. R package version 0.1.0. http://CRAN.R-project.org/package=mfe

[03] A. Orriols-Puig, N. Maciá, T.K. Ho, Documentation for the data complexity library in C++, Tech. rep., La Salle - Universitat Ramon Llull (2010).

[04] L.P.F. Garcia, A.C.P.L.F. de Carvalho, A.C. Lorena. Noise detection in the meta-learning level. Neurocomputing, v.176, 2016, p.14-25.

[05] Add Tomas paper ref

**[ADD citation]**

If you use our code/experiments in your research, please, cite [our paper]() where it was firstly used :

```
@article{Mantovani2017,
  author  = {},
  title   = {},
  journal = {},
  year    = {2017},
  pages   = {}
}
```
[ADD bibtex entry]
