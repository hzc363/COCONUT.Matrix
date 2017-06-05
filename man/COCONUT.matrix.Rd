
\name{COCONUT.matrix}
\alias{COCONUT.matrix}

\title{
 COmbat CO-Normalization Using conTrols (use matrix as input): COCONUT.matrix
}
\description{
COCONUT is a modified version of the ComBat empiric Bayes batch correction method (Johnson et al., Biostatistics 2007). It allows for batch correction of microarray datasets using control samples, which allows for diseased samples to be compared in pooled analysis. It makes a strong assumption that all controls come from the same distribution. COCONUT.matrix function gives the same result as the COCONUT function. The difference is that COCONUT.matrix takes a matrix (rows: genes, columns: samples) as input. 
}
\usage{
COCONUT.matrix(dat, batch, control, par.prior=TRUE,itConv=1e-04, parallel=FALSE, mc.cores=1)
}
\arguments{
  \item{dat}{
A matrix with rows as genes and columns as samples.
}
  \item{batch}{
A vector indicating what batch each sample belongs to. The length should be the same as the number of samples. 
}
  \item{control}{
A vector indicating which samples are controls (1 for control samples, 0 for non-control samples). The length should be the same as the number of samples. 
}
 
 \item{par.prior}{
Whether to use parametric or non-parametric priors in empiric Bayes updates. Defaults to parametric. Non-parametric can be quite time-consuming.
}
 \item{itConv}{
 Allows user to change threshold for iterative solver. For advanced users only.
}
 \item{parallel}{
 Parallel derivation of priors. Uses parallel:mclapply, and so will not work on Windows machines (sorry).
}
 \item{mc.cores}{
 If parallel=T, mc.cores should be set to the desired number of cores. Defaults to 1, so unless this is changed, functionality will be serial.
}
}

\value{
COCONUT returns a normalized matrix. 
}

\references{
Sweeney TE et al., "Robust classification of bacterial and viral infections via integrated host gene expression diagnostics", Science Translational Medicine, 2016
}
\author{
Timothy E Sweeney, MD, PhD (tes17 [at] stanford [dot] edu)
Zicheng Hu
}

\section{Warning }{
COCONUT makes the strong assumption that the control data are from the same distribution. This may not always be an appropriate assumption. Users are advised to think carefully about how to apply COCONUT locally.
}
\seealso{
  \code{\link{COCONUT-package}}
}
\examples{
# load data
data(GSEs.matrix)

# run COCONUT.matrix
GSEs.COCONUT <- COCONUT.matrix(dat=dat,
                        batch=batch,
                        control=control)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
