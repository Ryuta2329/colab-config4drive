colab_config <- function(local_path="/usr/local/lib/python3.7/dist-packages/google/colab/_ipython.py") {
  if (!require(googledrive, quietly = TRUE, warn.conflicts=FALSE))
    install.packages("googledrive")
  if (!require(httpuv, quietly = TRUE, warn.conflicts=FALSE))
    install.packages("httpuv")

  # Y cargo ambas librerias
  library(googledrive, quietly = TRUE, warn.conflicts=FALSE) 
  library(httpuv, quietly = TRUE, warn.conflicts=FALSE)

  if (file.exists(local_path)) {  
    if (!require(R.Utils, quietly = TRUE, warn.conflicts=FALSE))
      install.packages("R.utils")

    library("R.utils", quietly=TRUE, warn.conflicts=FALSE)
    library("httr", quietly=TRUE, warn.conflicts=FALSE)

    my_check <- function() {return(TRUE)}
    reassignInPackage("is_interactive", pkgName = "httr", my_check)
    options(rlang_interactive=TRUE)
  }

  drive_auth(use_oob = TRUE, cache = FALSE)
}
