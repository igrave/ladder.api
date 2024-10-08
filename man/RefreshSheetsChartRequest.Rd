% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/api_objects.R
\name{RefreshSheetsChartRequest}
\alias{RefreshSheetsChartRequest}
\title{RefreshSheetsChartRequest Object}
\usage{
RefreshSheetsChartRequest(objectId = NULL)
}
\arguments{
\item{objectId}{(string)
The object ID of the chart to refresh.}
}
\value{
RefreshSheetsChartRequest object
}
\description{
RefreshSheetsChartRequest Object
}
\details{
Refreshes an embedded Google Sheets chart by replacing it with the latest version of the chart from Google Sheets. NOTE: Refreshing charts requires at least one of the spreadsheets.readonly, spreadsheets, drive.readonly, or drive OAuth scopes.
}
