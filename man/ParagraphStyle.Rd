% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/api_objects.R
\name{ParagraphStyle}
\alias{ParagraphStyle}
\title{ParagraphStyle Object}
\usage{
ParagraphStyle(
  lineSpacing = NULL,
  alignment = NULL,
  indentStart = NULL,
  indentEnd = NULL,
  spaceAbove = NULL,
  spaceBelow = NULL,
  indentFirstLine = NULL,
  direction = NULL,
  spacingMode = NULL
)
}
\arguments{
\item{lineSpacing}{(number)
The amount of space between lines, as a percentage of normal, where normal is represented as 100.0. If unset, the value is inherited from the parent.}

\item{alignment}{(string)
The text alignment for this paragraph.
\itemize{
\item \code{ALIGNMENT_UNSPECIFIED}: The paragraph alignment is inherited from the parent.
\item \code{START}: The paragraph is aligned to the start of the line. Left-aligned for LTR text, right-aligned otherwise.
\item \code{CENTER}: The paragraph is centered.
\item \code{END}: The paragraph is aligned to the end of the line. Right-aligned for LTR text, left-aligned otherwise.
\item \code{JUSTIFIED}: The paragraph is justified.
}}

\item{indentStart}{(\link{Dimension})
The amount indentation for the paragraph on the side that corresponds to the start of the text, based on the current text direction. If unset, the value is inherited from the parent.}

\item{indentEnd}{(\link{Dimension})
The amount indentation for the paragraph on the side that corresponds to the end of the text, based on the current text direction. If unset, the value is inherited from the parent.}

\item{spaceAbove}{(\link{Dimension})
The amount of extra space above the paragraph. If unset, the value is inherited from the parent.}

\item{spaceBelow}{(\link{Dimension})
The amount of extra space below the paragraph. If unset, the value is inherited from the parent.}

\item{indentFirstLine}{(\link{Dimension})
The amount of indentation for the start of the first line of the paragraph. If unset, the value is inherited from the parent.}

\item{direction}{(string)
The text direction of this paragraph. If unset, the value defaults to LEFT_TO_RIGHT since text direction is not inherited.
\itemize{
\item \code{TEXT_DIRECTION_UNSPECIFIED}: The text direction is inherited from the parent.
\item \code{LEFT_TO_RIGHT}: The text goes from left to right.
\item \code{RIGHT_TO_LEFT}: The text goes from right to left.
}}

\item{spacingMode}{(string)
The spacing mode for the paragraph.
\itemize{
\item \code{SPACING_MODE_UNSPECIFIED}: The spacing mode is inherited from the parent.
\item \code{NEVER_COLLAPSE}: Paragraph spacing is always rendered.
\item \code{COLLAPSE_LISTS}: Paragraph spacing is skipped between list elements.
}}
}
\value{
ParagraphStyle object
}
\description{
ParagraphStyle Object
}
\details{
Styles that apply to a whole paragraph. If this text is contained in a shape with a parent placeholder, then these paragraph styles may be inherited from the parent. Which paragraph styles are inherited depend on the nesting level of lists:
\itemize{
\item A paragraph not in a list will inherit its paragraph style from the paragraph at the 0 nesting level of the list inside the parent placeholder.
\item A paragraph in a list will inherit its paragraph style from the paragraph at its corresponding nesting level of the list inside the parent placeholder. Inherited paragraph styles are represented as unset fields in this message.
}
}
