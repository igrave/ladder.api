% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/api_objects.R
\name{DeleteTextRequest}
\alias{DeleteTextRequest}
\title{DeleteTextRequest Object}
\usage{
DeleteTextRequest(objectId = NULL, cellLocation = NULL, textRange = NULL)
}
\arguments{
\item{objectId}{(string)
The object ID of the shape or table from which the text will be deleted.}

\item{cellLocation}{(\link{TableCellLocation})
The optional table cell location if the text is to be deleted from a table cell. If present, the object_id must refer to a table.}

\item{textRange}{(\link{Range})
The range of text to delete, based on TextElement indexes. There is always an implicit newline character at the end of a shape's or table cell's text that cannot be deleted. \code{Range.Type.ALL} will use the correct bounds, but care must be taken when specifying explicit bounds for range types \code{FROM_START_INDEX} and \code{FIXED_RANGE}. For example, if the text is "ABC", followed by an implicit newline, then the maximum value is 2 for \code{text_range.start_index} and 3 for \code{text_range.end_index}. Deleting text that crosses a paragraph boundary may result in changes to paragraph styles and lists as the two paragraphs are merged. Ranges that include only one code unit of a surrogate pair are expanded to include both code units.}
}
\value{
DeleteTextRequest object
}
\description{
DeleteTextRequest Object
}
\details{
Deletes text from a shape or a table cell.
}
