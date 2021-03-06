% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pvclust.R
\name{pvrect2}
\alias{pvrect2}
\title{Draw Rectangles Around a Dendrogram's Clusters with High/Low P-values}
\usage{
pvrect2(x, alpha = 0.95, pv = "au", type = "geq", max.only = TRUE,
  border = 2, xpd = TRUE, lower_rect, ...)
}
\arguments{
\item{x}{object of class pvclust.}

\item{alpha}{threshold value for p-values., Default: 0.95}

\item{pv}{character string which specifies the p-value to be used. It should be either of "au" or "bp", corresponding to AU p-value or BP value, respectively. See plot.pvclust for details. , Default: 'au'}

\item{type}{one of "geq", "leq", "gt" or "lt". If "geq" is specified, clusters with p-value greater than or equals the threshold given by "alpha" are returned or displayed. Likewise "leq" stands for lower than or equals, "gt" for greater than and "lt" for lower than the threshold value. The default is "geq"., Default: 'geq'}

\item{max.only}{logical. If some of clusters with high/low p-values have inclusion relation, only the largest cluster is returned (or displayed) when max.only=TRUE., Default: TRUE}

\item{border}{numeric value which specifies the color of borders of rectangles., Default: 2}

\item{xpd}{A logical value (or NA.), passed to par. Default is TRUE, in order to allow the rect to be below the labels. If FALSE, all plotting is clipped to the plot region, if TRUE, all plotting is clipped to the figure region, and if NA, all plotting is clipped to the device region. See also clip., Default: TRUE}

\item{lower_rect}{a (scalar) value of how low should the lower part of the rect be. If missing, it will take the value of par("usr")[3L] (or par("usr")[2L], depending if horiz = TRUE or not), with also the width of the labels. (notice that we would like to keep xpd = TRUE if we want the rect to be after the labels!) You can use a value such as 0, to get the rect above the labels.}

\item{...}{passed to \link{rect}}
}
\description{
Draws rectangles around the branches of a dendrogram highlighting the corresponding clusters with low p-values.
This is based on \link[pvclust]{pvrect}, allowing to draw the rects till the bottom of the labels.
}
\examples{
\dontrun{


library(dendextend)
library(pvclust)
data(lung) # 916 genes for 73 subjects
set.seed(13134)
result <- pvclust(lung[, 1:20], method.dist="cor", method.hclust="average", nboot=10)

par(mar = c(9,2.5,2,0))
dend <- as.dendrogram(result)
dend \%>\%    
   pvclust_show_signif(result, signif_value = c(3,.5)) \%>\%
   pvclust_show_signif(result, signif_value = c("black", "grey"), show_type = "col") \%>\% 
   plot(main = "Cluster dendrogram with AU/BP values (\%)")
pvrect2(result, alpha=0.95)
# getting the rects to the tips / above the labels
pvrect2(result, lower_rect = .15, border = 4, alpha=0.95, lty = 2)
# Original function
# pvrect(result, alpha=0.95)
text(result, alpha=0.95)

}

}
\seealso{
\link[pvclust]{pvrect}, \link{pvclust_show_signif}
}
