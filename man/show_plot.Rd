% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/show_plot.R
\name{show_plot}
\alias{show_plot}
\title{Visualise summaries and comparisons of one or two dataframes.}
\usage{
show_plot(x, text_labels = TRUE, alpha = 0.05, high_cardinality = 0,
  plot_layout = NULL, col_palette = 0, plot_type = "bar",
  label_thresh = 0.1)
}
\arguments{
\item{x}{Dataframe resulting from a call to an `inspect_` function.}

\item{text_labels}{Whether to show text annotation on plots (when \code{show_plot = T}).}

\item{alpha}{Alpha level for performing significance tests.  Defaults to 0.05.}

\item{high_cardinality}{Minimum number of occurrences of category to be shown as a distinct segment 
in the plot (\code{inspect_cat} only).  Default is 0.  This can help when some columns 
contain many unique or near-unique levels that take a long time to render.}

\item{plot_layout}{Vector specifying the number of rows and columns 
in the plotting grid.  For example, 3 rows and 2 columns would be specified as 
\code{plot_layout = c(3, 2)}.
Default is \code{TRUE}.}

\item{col_palette}{Integer indicating the colour palette to use.

 - `0`: (default) `ggplot2` color palette
 - `1`: a [colorblind friendly palette](http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/)
 - `2`: [80s theme](https://www.color-hex.com/color-palette/25888)
 - `3`: [rainbox theme](https://www.color-hex.com/color-palette/79261)
 - `4`: [mario theme](https://www.color-hex.com/color-palette/78663)
 - `5`: [pokemon theme](https://www.color-hex.com/color-palette/78664)}

\item{plot_type}{String determining the type of plot to show.  Defaults to `"bar"`.}

\item{label_thresh}{Minimum percentage frequency of category for a text label to be shown.
Defaults to 0.1.  Smaller values will show potentially smaller labels, but at the expense of longer
rendering time.}
}
\description{
Visualise summaries and comparisons of one or two dataframes.
}
\examples{
# Load 'starwars' data
data("starwars", package = "dplyr")

# categorical plot
x <- inspect_cat(starwars) 
show_plot(x)

# correlations in numeric columns
x <- inspect_cor(starwars)
show_plot(x)

# feature imbalance bar plot
x <- inspect_imb(starwars)
show_plot(x)

# memory usage barplot
x <- inspect_mem(starwars)
show_plot(x)

# missingness barplot
x <- inspect_na(starwars)
show_plot(x)

# histograms for numeric columns
x <- inspect_num(starwars)
show_plot(x)

# barplot of column types
x <- inspect_types(starwars)
show_plot(x)
}
