## This file is the interface between SlidesTools and the
## auth functionality in gargle.

# Initialization happens in .onLoad()
.auth <- NULL

## The roxygen comments for these functions are mostly generated from data
## in this list and template text maintained in gargle.
gargle_lookup_table <- list(
  PACKAGE     = "SlidesTools",
  YOUR_STUFF  = "your presentations",
  PRODUCT     = "Google Slides",
  API         = "Slides API",
  PREFIX      = "slides"
)

#' Authorize SlidesTools
#'
#' @eval gargle:::PREFIX_auth_description(gargle_lookup_table)
#' @eval gargle:::PREFIX_auth_details(gargle_lookup_table)
#' @eval gargle:::PREFIX_auth_params()
#' @param scopes A character vector of scopes to request.
#'   Pick from those listed at <https://developers.google.com/identity/protocols/oauth2/scopes>.
#'
#' @family auth functions
#' @export
#'
#' @examplesIf rlang::is_interactive()
#' # load/refresh existing credentials, if available
#' # otherwise, go to browser for authentication and authorization
#' slides_auth()
#'
#' # see user associated with current token
#' slides_user()
#'
#' # force use of a token associated with a specific email
#' slides_auth(email = "jenny@example.com")
#' slides_user()
#'
#' # force the OAuth web dance
#' slides_auth(email = NA)
#'
#' # use a 'read only' scope, so it's impossible to edit or delete files
#' slides_auth(scopes = "slides.readonly")
#'
#' # use a service account token
#' slides_auth(path = "foofy-83ee9e7c9c48.json")
#'
slides_auth <- function(email = gargle::gargle_oauth_email(),
                     path = NULL,
                     subject = NULL,
                     scopes = c(
                       "https://www.googleapis.com/auth/drive.file",
                       "https://www.googleapis.com/auth/presentations.currentonly"
                       ),
                     cache = gargle::gargle_oauth_cache(),
                     use_oob = gargle::gargle_oob_default(),
                     token = NULL) {
  cred <- gargle::token_fetch(
    scopes = scopes,
    app = slides_oauth_client(),
    email = email,
    path = path,
    subject = subject,
    package = "SlidesTools",
    cache = cache,
    use_oob = use_oob,
    token = token
  )
  if (!inherits(cred, "Token2.0")) {
    stop(
      "Can't get Google credentials.\n",
      "Are you running gslidesDevice in a non-interactive session? Consider:\n",
      "  * Call `slides_auth()` directly with all necessary specifics.\n",
      call. = FALSE
    )
  }
  .auth$set_cred(cred)
  .auth$set_auth_active(TRUE)

  invisible()
}

#' Suspend authorization
#'
#' @eval gargle:::PREFIX_deauth_description_with_api_key(gargle_lookup_table)
#'
#' @family auth functions
#' @export
#' @examples
#' \dontrun{
#' slides_deauth()
#' slides_user()
#' }
slides_deauth <- function() {
  .auth$set_auth_active(FALSE)
  .auth$clear_cred()
  invisible()
}

#' Produce configured token
#'
#' @eval gargle:::PREFIX_token_description(gargle_lookup_table)
#' @eval gargle:::PREFIX_token_return()
#'
#' @family low-level API functions
#' @export
#' @examples
#' \dontrun{
#' slides_token()
#' }
slides_token <- function() {
  if (!slides_has_token()) {
    slides_auth()
  }
  httr::config(token = .auth$cred)
}

#' Is there a token on hand?
#'
#' @eval gargle:::PREFIX_has_token_description(gargle_lookup_table)
#' @eval gargle:::PREFIX_has_token_return()
#'
#' @family low-level API functions
#' @export
#'
#' @examples
#' slides_has_token()
slides_has_token <- function() {
  inherits(.auth$cred, "Token2.0")
}

#' Edit and view auth configuration
#'
#' @eval gargle:::PREFIX_auth_configure_description(gargle_lookup_table)
#' @eval gargle:::PREFIX_auth_configure_params()
#' @eval gargle:::PREFIX_auth_configure_return(gargle_lookup_table)
#'
#' @family auth functions
#' @export
#' @examples
#' # see and store the current user-configured OAuth client (probaby `NULL`)
#' (original_client <- slides_oauth_client())
#'
#' # see and store the current user-configured API key (probaby `NULL`)
#' (original_api_key <- slides_api_key())
#'
#' # the preferred way to configure your own client is via a JSON file
#' # downloaded from Google Developers Console
#' # this example JSON is indicative, but fake
#' path_to_json <- system.file(
#'   "extdata", "client_secret_installed.googleusercontent.com.json",
#'   package = "gargle"
#' )
#' slides_auth_configure(path = path_to_json)
#'
#' # this is also obviously a fake API key
#' slides_auth_configure(api_key = "the_key_I_got_for_a_google_API")
#'
#' # confirm the changes
#' slides_oauth_client()
#' slides_api_key()
#'
#' # restore original auth config
#' slides_auth_configure(client = original_client, api_key = original_api_key)
slides_auth_configure <- function(client, path, api_key, app) {
  if (!missing(client) && !missing(path)) {
    stop("Must supply exactly one of `client` or `path`, not both")
  }
  stopifnot(missing(api_key) || is.null(api_key) || is_string(api_key))

  if (!missing(path)) {
    stopifnot(is_string(path))
    client <- gargle::gargle_oauth_client_from_json(path)
  }
  stopifnot(missing(client) || is.null(client) || inherits(client, "gargle_oauth_client"))

  if (!missing(client) || !missing(path)) {
    .auth$set_client(client)
  }

  if (!missing(api_key)) {
    .auth$set_api_key(api_key)
  }

  invisible(.auth)
}

#' @export
#' @rdname slides_auth_configure
slides_api_key <- function() {
  .auth$api_key
}

#' @export
#' @rdname slides_auth_configure
slides_oauth_client <- function() {
  .auth$client
}
#' Get info on current user
#'
#' @eval gargle:::PREFIX_user_description()
#' @eval gargle:::PREFIX_user_seealso()
#' @eval gargle:::PREFIX_user_return()
#'
#' @export
#' @examples
#' \dontrun{
#' slides_user()
#' }
slides_user <- function() {
  if (slides_has_token()) {
    gargle::token_email(slides_token())
  } else {
    NULL
  }
}
