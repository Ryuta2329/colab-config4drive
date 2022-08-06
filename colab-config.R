colab_config = function(local_path="/usr/local/lib/python3.7/dist-packages/google/colab/_ipython.py") {
  if (!require(googledrive))
    install.packages("googledrive")
  if (!require(httpuv))
    install.packages("httpuv")

  # Y cargo ambas librerias
  library(googledrive) 
  library(httpuv)

  if (file.exists(local_path)) {  
    if (!require(R.Utils))
      install.packages("R.utils")

    library("R.utils", quietly=TRUE, warn.conflicts=FALSE)
    library("httr", quietly=TRUE, warn.conflicts=FALSE)

    my_check = function() {return(TRUE)}
    reassignInPackage("is_interactive", pkgName = "httr", my_check)
    options(rlang_interactive=TRUE)
  }

  drive_auth(use_oob = TRUE, cache = FALSE)
}
