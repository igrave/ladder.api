% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/api_objects.R
\name{Table}
\alias{Table}
\title{Table Object}
\usage{
Table(
  rows = NULL,
  columns = NULL,
  tableRows = NULL,
  tableColumns = NULL,
  horizontalBorderRows = NULL,
  verticalBorderRows = NULL
)
}
\arguments{
\item{rows}{(integer)
Number of rows in the table.}

\item{columns}{(integer)
Number of columns in the table.}

\item{tableRows}{(list of \link{TableRow} objects)
Properties and contents of each row. Cells that span multiple rows are contained in only one of these rows and have a row_span greater than 1.}

\item{tableColumns}{(list of \link{TableColumnProperties} objects)
Properties of each column.}

\item{horizontalBorderRows}{(list of \link{TableBorderRow} objects)
Properties of horizontal cell borders. A table's horizontal cell borders are represented as a grid. The grid has one more row than the number of rows in the table and the same number of columns as the table. For example, if the table is 3 x 3, its horizontal borders will be represented as a grid with 4 rows and 3 columns.}

\item{verticalBorderRows}{(list of \link{TableBorderRow} objects)
Properties of vertical cell borders. A table's vertical cell borders are represented as a grid. The grid has the same number of rows as the table and one more column than the number of columns in the table. For example, if the table is 3 x 3, its vertical borders will be represented as a grid with 3 rows and 4 columns.}
}
\value{
Table object
}
\description{
Table Object
}
\details{
A PageElement kind representing a table.
}
