% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/api_objects.R
\name{TableBorderProperties}
\alias{TableBorderProperties}
\title{TableBorderProperties Object}
\usage{
TableBorderProperties(tableBorderFill = NULL, weight = NULL, dashStyle = NULL)
}
\arguments{
\item{tableBorderFill}{(\link{TableBorderFill})
The fill of the table border.}

\item{weight}{(\link{Dimension})
The thickness of the border.}

\item{dashStyle}{(string)
The dash style of the border.
\itemize{
\item \code{DASH_STYLE_UNSPECIFIED}: Unspecified dash style.
\item \code{SOLID}: Solid line. Corresponds to ECMA-376 ST_PresetLineDashVal value 'solid'. This is the default dash style.
\item \code{DOT}: Dotted line. Corresponds to ECMA-376 ST_PresetLineDashVal value 'dot'.
\item \code{DASH}: Dashed line. Corresponds to ECMA-376 ST_PresetLineDashVal value 'dash'.
\item \code{DASH_DOT}: Alternating dashes and dots. Corresponds to ECMA-376 ST_PresetLineDashVal value 'dashDot'.
\item \code{LONG_DASH}: Line with large dashes. Corresponds to ECMA-376 ST_PresetLineDashVal value 'lgDash'.
\item \code{LONG_DASH_DOT}: Alternating large dashes and dots. Corresponds to ECMA-376 ST_PresetLineDashVal value 'lgDashDot'.
}}
}
\value{
TableBorderProperties object
}
\description{
TableBorderProperties Object
}
\details{
The border styling properties of the TableBorderCell.
}
