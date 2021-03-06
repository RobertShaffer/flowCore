## ==========================================================================
## fcReferences provide a means to reference into workFlow environments.
## We provide methods to get and assign object from references, as well
## as methods to remove them along with the referenced objects
## ==========================================================================


## ==========================================================================
## Test for a NULL reference
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#' @export
setMethod("isNull",
          signature=signature("fcReference"),
          definition=function(f) is(f, "fcNullReference"))



## ==========================================================================
## Resolve a reference, i.e., get the symbol 'ID' from the environment
## 'env'. Resolving NULL references always returns NULL
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
## for NULL references
#' @export
setMethod("get",
          signature=signature(x="fcNullReference", pos = "missing",
              envir = "missing"),
          definition=function(x, pos=-1, envir=as.environment(pos),
              mode="any", inherits=TRUE) NULL)

## for all other references
#' @export
setMethod("get",
          signature=signature(x="fcReference", pos = "missing",
              envir = "missing"),
          definition=function(x, pos=-1, envir=as.environment(pos),
               mode="any", inherits=TRUE)
          {
              if(!resolved(x, FALSE)){
                  mess <- paste("Unable to resolve reference to object '",
                                x@ID, "'", sep="")
                  if(!is.na(w <- pmatch(tolower(x@ID), 
                                        tolower(ls(x@env))))) 
                      mess <- paste(mess, sprintf("Perhaps you meant %s?",
                                sQuote(ls(x@env)[w])), sep="\n")
                  stop(mess, call.=FALSE)
              }
              get(x@ID, x@env)
          })



## ==========================================================================
## Check whether a reference can be resolved (i.e., whether the referenced
## object exists in the evaluation environment)
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
resolved <- function(object, verbose=TRUE)
{
    unres <- nchar(object@ID) && !object@ID %in% ls(object@env)
    if(unres && verbose)
        cat("\nUnable to resolve reference to object '",
              object@ID, "'.", sep="")
    return(!unres)
}

