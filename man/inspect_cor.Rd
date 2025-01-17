% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/inspect_cor.R
\name{inspect_cor}
\alias{inspect_cor}
\title{Summarise and compare Pearson's correlation coefficients for numeric columns in one or two dataframes.}
\usage{
inspect_cor(df1, df2 = NULL, method = "pearson", with_col = NULL,
  alpha = 0.05, show_plot = FALSE)
}
\arguments{
\item{df1}{A data frame.}

\item{df2}{An optional second data frame for comparing correlation 
coefficients.  Defaults to \code{NULL}.}

\item{method}{a character string indicating which type of correlation coefficient to use, one 
of \code{"pearson"}, \code{"kendall"}, or \code{"spearman"}, which can be abbreviated.}

\item{with_col}{Character vector of column names to calculate correlations with all other numeric 
features.  The default \code{with_col = NULL} returns all pairs of correlations.}

\item{alpha}{Alpha level for correlation confidence intervals.  Defaults to 0.05.}

\item{show_plot}{(Deprecated) Logical flag indicating whether a plot should be shown.
Superseded by the function \code{show_plot()} and will be dropped in a future version.}
}
\value{
A tibble summarising and comparing the correlations for each numeric column 
in one or a pair of data frames.
}
\description{
Summarise and compare Pearson's correlation coefficients for numeric columns in one or two dataframes.
}
\details{
When \code{df2 = NULL}, a tibble containing correlation coefficients for \code{df1} is 
returned:
\itemize{
  \item \code{col_1}, \code{co1_2} character vectors containing names of numeric 
  columns in \code{df1}.
  \item \code{corr} the calculated correlation coefficient.
  \item \code{lower}, \code{upper} lower and upper values of the confidence interval 
  for the correlations.
  \item \code{p_value} p-value associated with a test where the null hypothesis is that 
  the numeric pair have 0 correlation. 
}

If \code{df1} has class \code{grouped_df}, then correlations will be calculated within the grouping levels 
and the tibble returned will have an additional column corresponding to the group labels.

When both \code{df1} and \code{df2} are specified, the tibble returned contains
 a comparison of the correlation coefficients across pairs of columns common to both 
 dataframes.
\itemize{
  \item \code{col_1}, \code{co1_2} character vectors containing names of numeric columns 
  in either \code{df1} or \code{df2}.
  \item \code{corr_1}, \code{corr_2} numeric columns containing correlation coefficients from
  \code{df1} and \code{df2}, respectively.
  \item \code{p_value} p-value associated with the null hypothesis that the two correlation 
  coefficients are the same.  Small values indicate that the true correlation coefficients 
  differ between the two dataframes.
}

Note that confidence intervals for \code{kendall} and \code{spearman} assume a normal sampling
distribution for the Fisher z-transform of the correlation.
}
\examples{

# Load dplyr for starwars data & pipe
library(dplyr)

# Single dataframe summary
inspect_cor(starwars)
# Only show correlations with 'mass' column
inspect_cor(starwars, with_col = "mass")

# Paired dataframe summary
inspect_cor(starwars, starwars[1:10, ])

# NOT RUN - change in correlation over time
# library(dplyr)
# tech_grp <- tech \%>\% 
#         group_by(year) \%>\%
#         inspect_cor()
# tech_grp \%>\% show_plot()     

}
