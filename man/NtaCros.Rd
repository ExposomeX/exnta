% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/exponta.R
\name{NtaCros}
\alias{NtaCros}
\title{Association analysis}
\usage{
NtaCros = function(PID,OutPath = "default",VarsY,VarsX = "all.x",
    VarsN = "single.factor",FdrCorrect = T,SelMethod = "all",StepwizeThr = 0.1,
    RF_ImpThr = 0.9,IncCova = F,Family,RepMsr  = F,Corstr= "ar1")
}
\arguments{
\item{PID}{chr. Program ID. It must be the same with the PID generated by ExpoNTA}

\item{OutPath}{chr. Output file directory, e.g. "D:/test". It should be noted that the slash symbol is "/", not "\".
If "default", the current working directory will be set.}

\item{VarsY}{chr. Outcome variable used for modeling. Only one variable can be entered.}

\item{VarsX}{chr. Exposure variable used for modeling. The default option is
"all.x" (All exposure variables are included). Users can also choose available variables.
It should be noted that there is fixed format for the entering characters
separated with comma and without space, e.g., "X1,X2,X3"}

\item{VarsN}{chr. Choose the single factor or multiple factor model.
Available options include "single.factor" and "multiple.factor"}

\item{FdrCorrect}{lgl. T (or TRUE) and F (or FALSE).  Whether to correct the multiple hypotheses by false positive rate (FDR) method.}

\item{SelMethod}{chr. Methods to select the significant features. Options include
"stepwise" (multiple linear regress using stepwise algorithm),
"lasso" (multiple linear regress using LASSO regularization algorithm),
"random.forest" (random forest), and "all" (combination of the above three method)..}

\item{StepwizeThr}{num. Threshold of the P value for stepwise regression to
screen important variables. It ranges 0.05-0.25 with the default value of 0.1.}

\item{RF_ImpThr}{num. Threshold of the total importance for the variables to a random forest model. It ranges 0.5-1.0 with the default value of 0.9.}

\item{IncCova}{lgl. T (or TRUE) and F (or FALSE). Whether to include the covariate selected in the step of "FindCovaNta".}

\item{Family}{chr. The link function for the regression model according
the data type of outcomes, including "gaussian" for continuous variable,
"binomial" for binary variable, and "poisson" for counting variable}

\item{RepMsr}{lgl. T (or TRUE) and F (or FALSE). Whether existing repeated measurement of the subjects.}

\item{Corstr}{chr. If "RepMsr" = T, the generalized estimating equations (GEE) will be used.
For GEE, three correlation structure options are "exchangeable" "ar1" "unstructured".}
}
\value{
A list containing non-target analysis association results
}
\description{
Association analysis for non-targeted data
}
\examples{
res <- InitNTA()
   res1 = LoadNTA(PID = res$PID, UseExample = "example#1")
   res2 = DelNearZeroVar(PID = res$PID) #optional, If run, expotidy package is needed
   res3 = DelMiss(PID = res$PID) #optional, If run, expotidy package is needed
   res4 = NtaCros(PID=res$PID, VarsY = "Y2", VarsX = "all.x",
   VarsN = "multiple.factor", FdrCorrect = "T", SelMethod = "lasso",
   StepwizeThr = 0.1, RF_ImpThr = 0.9, IncCova = "F", Family = "binomial",
   RepMsr = "F", Corstr = "ar1")
}
\author{
Mingliang Fang, Bin Wang (corresponding author)
}
