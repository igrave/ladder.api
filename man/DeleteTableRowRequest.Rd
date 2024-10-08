% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/api_objects.R
\name{DeleteTableRowRequest}
\alias{DeleteTableRowRequest}
\title{DeleteTableRowRequest Object}
\usage{
DeleteTableRowRequest(tableObjectId = NULL, cellLocation = NULL)
}
\arguments{
\item{tableObjectId}{(string)
The table to delete rows from.}

\item{cellLocation}{(\link{TableCellLocation})
The reference table cell location from which a row will be deleted. The row this cell spans will be deleted. If this is a merged cell, multiple rows will be deleted. If no rows remain in the table after this deletion, the whole table is deleted.}
}
\value{
DeleteTableRowRequest object
}
\description{
DeleteTableRowRequest Object
}
\details{
Deletes a row from a table.
}
