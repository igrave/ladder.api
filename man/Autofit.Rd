% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/api_objects.R
\name{Autofit}
\alias{Autofit}
\title{Autofit Object}
\usage{
Autofit(autofitType = NULL, fontScale = NULL, lineSpacingReduction = NULL)
}
\arguments{
\item{autofitType}{(string)
The autofit type of the shape. If the autofit type is AUTOFIT_TYPE_UNSPECIFIED, the autofit type is inherited from a parent placeholder if it exists. The field is automatically set to NONE if a request is made that might affect text fitting within its bounding text box. In this case the font_scale is applied to the font_size and the line_spacing_reduction is applied to the line_spacing. Both properties are also reset to default values.
\itemize{
\item \code{AUTOFIT_TYPE_UNSPECIFIED}: The autofit type is unspecified.
\item \code{NONE}: Do not autofit.
\item \code{TEXT_AUTOFIT}: Shrink text on overflow to fit the shape.
\item \code{SHAPE_AUTOFIT}: Resize the shape to fit the text.
}}

\item{fontScale}{(number)
The font scale applied to the shape. For shapes with autofit_type NONE or SHAPE_AUTOFIT, this value is the default value of 1. For TEXT_AUTOFIT, this value multiplied by the font_size gives the font size that is rendered in the editor. This property is read-only.}

\item{lineSpacingReduction}{(number)
The line spacing reduction applied to the shape. For shapes with autofit_type NONE or SHAPE_AUTOFIT, this value is the default value of 0. For TEXT_AUTOFIT, this value subtracted from the line_spacing gives the line spacing that is rendered in the editor. This property is read-only.}
}
\value{
Autofit object
}
\description{
Autofit Object
}
\details{
The autofit properties of a Shape.
}
