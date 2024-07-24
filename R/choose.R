#' Choose Slides presentation
#'
#' Opens a webpage for a user to authenticate with Google and select a presentation.
#' This presentation is then authorised for use with SlidesTools.
#'
#' @return A presentation id
#'
#' @export
#'
#' @examples
choose_slides <- function() {
  request_url <- "http://127.0.0.1:1083/index.html"
  auth_slide_id <- NULL

  server <- httpuv::startServer(
    host = "127.0.0.1", port = 1083,
    app = list(
      staticPaths = list("index.html" = "inst/picker.html"),
      staticPathOptions = httpuv::staticPathOptions(
        headers = list(accesstoken = .auth$cred$credentials$access_token)
      ),
      call = function(req) {
        if (nchar(req$QUERY_STRING)) {
          auth_slide_id <<- sub("?slides=", "", req$QUERY_STRING, fixed = TRUE)
        }
        list(
          status = 200L,
          headers = list(
            'Content-Type' = 'text/html'
          ),
          body = "Hello world!"
        )
      }
    )
  )

  on.exit(httpuv::stopServer(server))

  message("Waiting for authentication in browser...")
  message("Press Esc/Ctrl + C to abort")
  httr::BROWSE(request_url)
  while (is.null(auth_slide_id)) {
    httpuv::service()
    Sys.sleep(0.001)
  }
  httpuv::service() # to send text back to browser

  if (identical(auth_slide_id, NA)) {
    stop("Presentation authorisation failed.", call. = FALSE)
  }

  message("Presentation authorisation complete.")
  auth_slide_id
}
#
#
# viewer <- getOption("viewer")
# viewer("http://127.0.0.1:1083/index.html")
