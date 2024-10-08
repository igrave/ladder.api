% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/api_objects.R
\name{TableRow}
\alias{TableRow}
\title{TableRow Object}
\usage{
TableRow(rowHeight = NULL, tableRowProperties = NULL, tableCells = NULL)
}
\arguments{
\item{rowHeight}{(\link{Dimension})
Height of a row.}

\item{tableRowProperties}{(\link{TableRowProperties})
Properties of the row.}

\item{tableCells}{(list of \link{TableCell} objects)
Properties and contents of each cell. Cells that span multiple columns are represented only once with a column_span greater than 1. As a result, the length of this collection does not always match the number of columns of the entire table.}
}
\value{
TableRow object
}
\description{
TableRow Object
}
\details{
Properties and contents of each row in a table.
}
