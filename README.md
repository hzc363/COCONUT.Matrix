# COCONUT.matrix package
Zicheng Hu

## Introduction

###COCONUT
Direct comparison of different microarray cohorts is impossible due both to inherent differences in underlying microarray platform and processing (technical) batch effects. In order to make use of these data, we need to co-normalize cohorts in such a way that (1) no bias is introduced (i.e., the normalization protocol should be blind to disease state); (2) there should be no change to the distribution of a gene within a study, and (3) a gene should show the same distributions between studies after normalization.

Sweeney TE et al. thus developed a modified version of the ComBat empiric Bayes normalization method (Johnson et al., Biostatistics 2007) to co-normalize control samples from different cohorts to allow for direct comparison of diseased samples from those same cohorts. We call this method COmbat CO-Normalization Using conTrols, or 'COCONUT' . COCONUT makes one strong assumption, which is that it forces controls/healthy patients from different cohorts to represent the same distribution.

Briefly, all cohorts are split into the control and diseased components. The control components undergo ComBat co-normalization without covariates. The ComBat estimated parameters are obtained for each dataset for the control component, and then applied onto the diseased component. This forces the diseased components of all cohorts to be from the same background distribution, but retain their relative distance from the control component . Importantly, it also does not require any a priori knowledge of what type of disease is present in the diseased portion of the data. This method does have the notable requirement that controls/healthy patients are required to be present in a dataset in order for it to be pooled with other available data. Also, since control/healthy patients are set to be in the same distribution, it should only be used where such an assumption is reasonable (i.e., within the same tissue type, among the same species, etc.).

### COCONUT.matrix
COCONUT.matrix is a modified version of the original COCONUT package (available on CRAN). COCONUT.matrix allow users to use a single matrix (rows = genes, columns = samples) as data input, thus makes the use of COCONUT easier under some circumstances. All functions that are available in the original COCONUT package is also available in COCONUT.matrix package. **Please cite the original COCONUT paper as the reference:**

**Sweeney TE et al., "Robust classification of bacterial and viral infections via integrated host gene expression diagnostics", Science Translational Medicine, 2016**

## Installation

```
library("devtools")
install_github("hzc363/COCONUT.matrix")
```

## Example
```
library("COCONUT.matrix")

# load data
data(GSEs.matrix)

# run COCONUT.matrix
GSEs.COCONUT <- COCONUT.matrix(dat=dat,
                        batch=batch,
                        control=control)
```

