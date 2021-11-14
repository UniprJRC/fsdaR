## Probably not needed ###############################################################
internal.trace <- FALSE

## Controllo numero pari dei parametri opzionali
assertEvenNumberedOptList <- function(optArgList)
{
    ## Controllo numero pari dei parametri opzionali
    optLen = length(optArgList)
    if (optLen %% 2 != 0)
    {
        stop("Optional argument list must have an even number of parameters")
    }
}

## Converte gli oggetti R in oggetti Java
checkOptArg <- function(optlist, paramName, structfnp)
{
    result = list()

    if (paramName %in% optlist)
    {
        idx = match(paramName, optlist, nomatch = 0)
        param = optlist[[idx+1]]

        if (is.numeric(param) && length(param) == 1)
        {# Pure scalar
            paramValue = as.double(param);
            result = list(.jnew("java/lang/String", paramName), .jnew("java/lang/Double", paramValue))
        } else if (is.numeric(param) && length(param) > 1) { # Vector of scalars
            result = list(.jnew("java/lang/String", paramName), .jarray(param, dispatch=TRUE))
        } else if (is.character(param) && length(param) == 1) { # Single string # !is.vector(param)
            result = list(.jnew("java/lang/String", paramName), .jnew("java/lang/String", param))
        } else if (is.list(param)) { # List(complex structure))
            structmap = structfnp(param)
            result = list(.jnew("java/lang/String", paramName), structmap)
        } else if (is.vector(param) && is.character(param)) {
            cellArr = structfnp(param)
            result = list(.jnew("java/lang/String", paramName), cellArr)
        } #else if (is.vector(param) && is.numeric(param)) {
        #result = .jarray(param, dispatch = TRUE) }
        else {
            stop(paste("Param <", paramName, "> is neither a list nor numeric"))
        }
    }
    return (result)
}

##
checkOptArg <- function(optlist, paramName, structfnp)
{
  result = list()

  if (paramName %in% optlist)
  {
    idx = match(paramName, optlist, nomatch = 0)
    param = optlist[[idx+1]]

    if (is.numeric(param) && length(param) == 1)
    {# Pure scalar
      paramValue = as.double(param);
      result = list(.jnew("java/lang/String", paramName), .jnew("java/lang/Double", paramValue))
    } else if (is.numeric(param) && length(param) > 1) { # Vector of scalars
      result = list(.jnew("java/lang/String", paramName), .jarray(param, dispatch=TRUE))
    } else if (is.character(param) && length(param) == 1) { # Single string # !is.vector(param)
      result = list(.jnew("java/lang/String", paramName), .jnew("java/lang/String", param))
    } else if (is.list(param)) { # List(complex structure))
      structmap = structfnp(param)
      result = list(.jnew("java/lang/String", paramName), structmap)
    } else if (is.vector(param) && is.character(param)) {
      cellArr = structfnp(param)
      result = list(.jnew("java/lang/String", paramName), cellArr)
    } #else if (is.vector(param) && is.numeric(param)) {
    #result = .jarray(param, dispatch = TRUE) }
    else {
      stop(paste("Param <", paramName, "> is neither a list nor numeric"))
    }
  }
  return (result)
}

##  VT::14.01.2018 - asCellArray=FALSE - the numerics will be passed as cell array
##  - independently of their length
##  - used in resindexplot for the parameter 'numlab' - when with length 1, it can be either a scalar or a cell array
##  - see the function numericVector2CellArray() which is identical to stringVector2CellArray
##
rType2MatlabType <- function(attrName, attrValue, forceStringsToCellArray = FALSE, asCellArray=FALSE)
{
  val = NULL

  if(asCellArray)  {
    if (is.numeric(attrValue))
        val = numericVector2CellArray((attrValue), "")
    else
        cat(paste("Warning: attribute <", attrName, "> cannot be transfered as Cell Array. Skipping...\n"))
    return(val)
  }

  if (is.numeric(attrValue) && length(attrValue) == 1) {         # Pure scalar value
    if (is.double(attrValue)) {
      val = .jnew("java/lang/Double", as.double(attrValue))
    } else if (is.integer(attrValue)) {
      val = .jnew("java/lang/Integer", as.integer(attrValue))
    }
  } else if (is.numeric(attrValue) && length(attrValue) > 1) {   # Vector of scalars
    val = .jarray((attrValue), dispatch=TRUE)
  }else if (is.character(attrValue) && length(attrValue) == 1) { # Single string
    if (forceStringsToCellArray) {
      val = stringVector2CellArray((attrValue), "")
    } else {
      val = .jnew("java/lang/String", attrValue)
    }
  }else if (is.vector(attrValue) && is.character(attrValue)) {   # Vector of strings
    val = stringVector2CellArray((attrValue), "")
  } else if (is.list(attrValue)) {                               # List (nested)
    if (is.matrix(attrValue)) {
      val = rewrapComplexNumericCellArray(attrValue)
    } else {
      val = list2MatlabStruct(attrValue, forceStringsToCellArray)
    }
  } else if (is.logical(attrValue)) {
    if (attrValue == TRUE) {
      val = .jnew("java/lang/Boolean", "true")
    } else {
      val = .jnew("java/lang/Boolean", "false")
    }
  } else if (isJavaObject(attrValue)) {                          # some kind of Java object
    cat(paste("Warning: attribute <", attrName, "> is a Java object.\n"))
  } else {
    cat(paste("Warning: attribute <", attrName, "> is of unknown type.\n"))
  }

  return(val)
}

list2MatlabStruct <- function(rList, forceStringsToCellArray = FALSE)
{
  matlabFields = vector()
  matlabValues = vector()

  if (!is.null(rList) && is.list(rList)) {

    if (length(rList) > 0) {
      for (attrName in names(rList)) {
        attrValue = rList[[attrName]];

        if (!is.null(attrValue)) {
          val = rType2MatlabType(attrName, attrValue, forceStringsToCellArray);

          if (!is.null(val)) {
            matlabFields = c(matlabFields, attrName)
            matlabValues = c(matlabValues, val)
          }
        } else { # List field is null
          cat(paste("Warning: attribute <", attrName, "> is null. Skipping...\n"))
        }

      }

      fieldList = .jarray(matlabFields)

      structArray = new(J("com/mathworks/toolbox/javabuilder/MWStructArray"),
                        as.integer(1),
                        as.integer(1),
                        fieldList)

      for (i in 1:length(matlabFields)) {
        fieldName = .jnew("java/lang/String", matlabFields[i])

        fieldValue = .jcast(matlabValues[[i]], "java/lang/Object")
        structArray$set(fieldName, as.integer(1), fieldValue)
      }
    } else { # Empty list => create empty MWStructArray
      structArray = new(J("com/mathworks/toolbox/javabuilder/MWStructArray"))
    }

    return(structArray)
  } else { # Not a list or null
    stop("Function parameter is null or is not a list")
  }
}

pauseEnter <- function()
{
  cat ("Press [enter] to continue")
  line <- readline()
}

## finds all .R and .r files within a folder and sources them
sourceFolder <- function(folder, recursive = FALSE, ...)
{
  files <- list.files(folder, pattern = "[.][rR]$",
                      full.names = TRUE, recursive = recursive)
  if (!length(files))
    stop(simpleError(sprintf('No R files in folder "%s"', folder)))
  src <- invisible(lapply(files, source, ...))
  message(sprintf('%s files sourced from folder "%s"', length(src), folder))
}

##################################################################################
.initFsdaEngine <- function()
{
    ## VT::29.11.2017
    ## Hack for the R CMD check message "Found the following assignments to the global environment:"
    ##  from https://reformatcode.com/code/r/r-cmd-check-quotfound-the-following-assignments-to-the-global-environmentquot
    ##
    ##  - as.environment(pos) where pos=1 is equivalent to .GlobalEnv
    ##
    assign_engine_to_global <- function(pos=1){
        assign("fsdaEngine", fsdaEngine, envir=as.environment(pos))
    }

    ## TODO: vedere se possibile definire la variabile non globale con una funzione
    ## che viene chiamata con  costrutto try catch e con exists tutte le volte che serve

    if(!exists("fsdaEngine"))
    {

        ## Check if the Matlab Runtime is installed and stop if not.
        if(!checkRuntime())
            return(FALSE)

        message("\nThis is the very first call to the FSDA engine, \nit can take some time to initialize it ...")
        flush.console()

        ## java class generata da MATLAB Compiler con tutti i possibili prototipi di funzione
        fsdaEngine = .jnew("org/jrc/ipsc/globesec/sitaf/fsda4java/Fsda")
##        assign("fsdaEngine", fsdaEngine, envir = .GlobalEnv)
        assign_engine_to_global()

        message("\n")
        flush.console()

    } else {
      fsdaEngine = get("fsdaEngine", envir = .GlobalEnv)
      if (is.jnull(fsdaEngine)) {
        fsdaEngine = .jnew("org/jrc/ipsc/globesec/sitaf/fsda4java/Fsda")
##        assign("fsdaEngine", fsdaEngine, envir = .GlobalEnv)
        assign_engine_to_global()
      }
    }

    return(TRUE)
}

##  VT::13.01.2020
## Find out on which operating system we are running.
##  See https://www.r-bloggers.com/identifying-the-os-from-r/
##
##  The package 'fsdaR' supports Windows, Linux and MacOs (i.e. MATLAB
##      MCR exists only for these platforms).
##
##  Return: "windows", "osx", "linux", anything else
##
get_os <- function(){

    sysinf <- Sys.info()
    if(!is.null(sysinf))
    {
        os <- sysinf['sysname']
        if(os == 'Darwin')
            os <- "osx"
    } else
    {   ## mystery machine
        os <- .Platform$OS.type
        if(grepl("^darwin", R.version$os))
            os <- "osx"
        if(grepl("^solaris", R.version$os))
            os <- "sunos"
        if(grepl("linux-gnu", R.version$os))
            os <- "linux"
    }
    tolower(os)
}


## Check if the Matlab Runtime module is installed and stop if not.
##
checkRuntimeStop <- function()
{
    if(!checkRuntime()){
      stop("Matlab Runtime not installed!")
    }
}

## Check if the Matlab Runtime module is installed and display
##  a message requesting its installation, if not.
##
checkRuntime <- function()
{
  ## Do the check for installed Matlab runtime

##  ES::15.07.2021: update the MCR to V910 (R2021a)
##
##  runtimeVersion = "v90" # R2015b
##  runtimeVersion = "v96" # R2019a
  runtimeVersion = "v910" # R2021a


## Check Java version
    if(internal.trace)
    {
    cat("\nChecking Java version:\n")
    print(system("java -version"))
    }


## Do the check for installed Matlab runtime

    if(internal.trace)
    cat("\nCheck runtime... \n")

    ##  VT::13.01.2020
    ##  hostOs = .Platform$OS.type
    hostOs = get_os()

    if(internal.trace)
    cat("\nOperation system is ", hostOs, "\n")

    path = ""
    pathsep = ""
    filesep = ""
    searchSubstring = "" # vector(mode="character", length=0)

  if(hostOs == "linux") {
    path = Sys.getenv("LD_LIBRARY_PATH")
    pathsep = ":"
    filesep = "/"
    searchSubstring = paste("/", runtimeVersion, "/runtime/glnxa64", sep = "")
  } else if(hostOs == "windows") {
    path = Sys.getenv("PATH")
    pathsep = ";"
    filesep = "\\"
    searchSubstring = paste("\\", runtimeVersion, "\\runtime\\win64", sep = "")
  } else if(hostOs == "osx") {

    ## VT::15.5.2021
    ## Lets fake the Mac path where the MCR binaries are...
    ## path = paste0("/Applications/MATLAB/MATLAB_Runtime/", runtimeVersion, "/runtime/maci64")

    path = Sys.getenv("DYLD_LIBRARY_PATH")
    if(internal.trace)
    cat("\nSys.getenv('DYLD_LIBRARY_PATH'): ", path, "\n")

    pathsep = ":"
    filesep = "/"
    searchSubstring = paste("/", runtimeVersion, "/runtime/maci64", sep = "")
  }
  else {
    stop(paste("Not supported operating system:", hostOs, "- no MATLAB Runtime Compiler (MCR) exists for your platform!"))
  }

    if(internal.trace) {
    cat("\nPath: ", path, "\nSearch string: ", searchSubstring, "\n")
    cat("\nTry to find searchSubstring in path: \n")
    }

    rti = grepl(searchSubstring, path,  fixed=TRUE) > 0

    if(internal.trace)
    cat("\n", ifelse(rti, "Found!", "Not found!"), "\n")

    if(rti == TRUE)
    {
        if(!javabuilderJarIsOnClasspath())
        {
            if(internal.trace)
            cat("\nAdding javabuildar Jars (path, pathsep, filesep, runtimeVersion, searchSubstring): \n",
                "\npath=", path,
                "\npathsep=", pathsep,
                "\nfilesep=", filesep,
                "\nruntimeVersion=", runtimeVersion,
                "\nsearchSubstring=", searchSubstring, "\n")

            addJavabuilderJar2Classpath(path, pathsep, filesep, runtimeVersion, searchSubstring)
        }

    } else {

        if(hostOs == "windows")
          cat("\n!! Your installation does not contain the correct Matlab Runtime module.",
                "\nRequired is R2021a (9.10).\n",
                "\nIn order to enable execution of MATLAB files on systems without",
                "\nan installed version of MATLAB you need to install the Matlab Runtime.",
                "\n\nDownload the required version of the MATLAB Runtime - R2021a (aka 9.10) - ",
                "\n from https://ssd.mathworks.com/supportfiles/downloads/R2021a/Release/3/deployment_files/installer/complete/win64/MATLAB_Runtime_R2021a_Update_3_win64.zip\n\n",
                "\n Then, uncompress the above zip archive to a local folder and run 'setup.exe' to install the runtime.\n\n",
                "\n To avoid some spurious errors due to the new MCR installation on Windows (V9.10), add the following to the system path\n",
                "\n<RUNTIME_ROOT>\\bin\\win64\n",
                "\nWhich most probably should be:\n",
                "\nC:\\Program Files\\MATLAB\\MATLAB Runtime\\v910\\bin\\win64\n")
        else
            cat("\n!! Your installation does not contain the correct Matlab Runtime module.",
                "\nRequired is R2021a (9.10).\n",
                "\nIn order to enable execution of MATLAB files on systems without",
                "\nan installed version of MATLAB you need to install the Matlab Runtime.",
                "\n\nDownload and install the required version of the MATLAB Runtime - R2021a (aka 9.10) - ",
                "\nfrom the Web at http://www.mathworks.com/products/compiler/mcr.\n\n")
    }

  return(rti)
}

addJavabuilderJar2Classpath <- function(path, pathsep, filesep, version, rtSubstring)
{
  pathVector = unlist(strsplit(path, pathsep, fixed = TRUE))

  rtBinFolder = ""
  for (sp in pathVector) {
    if (grepl(rtSubstring, sp,  fixed=TRUE) > 0) {
      rtBinFolder = sp
      break;
    }
  }

  if (rtBinFolder == "") {
    stop("javabuilder.jar not found in system path. Please install the MATLAB Runtime first.")
  }

  rtFolderRoot = gsub(rtSubstring, "", rtBinFolder, fixed = TRUE)
  javabuilderJar = paste(rtFolderRoot, version, "toolbox",
                         "javabuilder", "jar", "javabuilder.jar", sep = filesep)
  .jaddClassPath(javabuilderJar)
}

javabuilderJarIsOnClasspath <- function()
{
    cpath = .jclassPath()

    if(internal.trace)
    cat("\nSearch for javabuilder Jars on classpath: \n", cpath, "\n")

    found = FALSE
    for (sp in cpath) {
        found = found || (grepl("javabuilder.jar", sp,  fixed=TRUE) > 0)
    }

    if(internal.trace)
    cat("\nFound =", found, "\n")

    return (found)
}

callFsdaFunctionNoArgout <- function(fsdaFunction, returnType, parameters)
{
    if(!.initFsdaEngine())
        return(NULL)

    ## Richiamo del riferimento alle librerie di MATLAB compilate in Java
    fsdaEngine = get("fsdaEngine", envir = .GlobalEnv)

    ## Chiamata alla funzione FSDA compilata in MATLAB
    out = .jcall(fsdaEngine,
               returnType,          # Tipo di ritorno del metodo Java (notazione JNI)
               fsdaFunction,        # Funzione FSDA da chiamare (es. LXS, FSR, ecc.)
               .jarray(parameters)) # Lista di parametri in ingresso

    return (out)
}

callFsdaFunction <- function(fsdaFunction, returnType, nargout, parameters)
{

    if(!.initFsdaEngine())
        return(NULL)

    ## Richiamo del riferimento alle librerie di MATLAB compilate in Java

    fsdaEngine <- get("fsdaEngine", envir = .GlobalEnv)

    ## Chiamata alla funzione FSDA compilata in MATLAB
    out = .jcall(fsdaEngine,
               returnType,          # Tipo di ritorno del metodo Java (notazione JNI)
               fsdaFunction,        # Funzione FSDA da chiamare (es. LXS, FSR, ecc.)
               as.integer(nargout), # Numero di output restituiti dalla funzione MATLAB
               .jarray(parameters)) # Lista di parametri in ingresso

    return (out)
}

# Disposes of any native MATLAB resources created by Java code
#
# For a native matlab resource to be freed, it must be an instance of the
# "com.mathworks.toolbox.javabuilder.Disposable" interface
freeMatlabResources <- function(resource, verbose = FALSE)
{

  func = deparse(sys.calls()[[sys.nframe()-1]])

  if (is.list(resource)) {
    for (i in 1:length(resource)) {

      if (!is.null(resource[[i]]) && class(resource[[i]]) == "jobjRef") {
        if (verbose) {
          message(paste(func, ": freeing MATLAB object", i , "of", length(resource)))
        }

        if (resource[[i]] %instanceof% "com.mathworks.toolbox.javabuilder.Disposable") {
          resource[[i]]$dispose()
        }
      }
    }
  }
}

# Converte un vettore di stringhe in un cell array di MATLAB
# Parametri:
# svec: vettore di stringhe (char)
# type: parametro stringa.
#       Se impostato a "col" crea un cell array colonna (n x 1),
#       in tutti gli altri casi crea un cell array riga (1 x n)
#
stringVector2CellArray <- function(svec, type) {

  # type of vector (row or column) provided as input parameter
  if (!identical(type, "")) {
    if (identical(type, "col")) {
      rows = length(svec)
      cols = 1
    } else {
      rows = 1
      cols = length(svec)
    }
  }

  # type of vector inferred from layout. Defaults to row type
  # if dim(vector) is null
  if (is.null(dim(svec))) {
    rows = length(svec)
    cols = 1
  }

  cellArray = .jnew("com/mathworks/toolbox/javabuilder/MWCellArray",
                    as.integer(rows),
                    as.integer(cols))

  for (i in 1:length(svec)) {
    cellContent = .jnew("java/lang/String", svec[i])
    index = .jarray(c(as.integer(i), as.integer(1)), "[I", dispatch = TRUE)
    .jcall(cellArray, "V", "set", index, .jcast(cellContent, "java/lang/Object"))
  }

  return (cellArray)
}

## VT::14.01.2018 - almost identical to stringVector2CellArray
##
numericVector2CellArray <- function(nvec, type) {

  # type of vector (row or column) provided as input parameter
  if (!identical(type, "")) {
    if (identical(type, "col")) {
      rows = length(nvec)
      cols = 1
    } else {
      rows = 1
      cols = length(nvec)
    }
  }

  # type of vector inferred from layout. Defaults to row type
  # if dim(vector) is null
  if (is.null(dim(nvec))) {
    rows = length(nvec)
    cols = 1
  }

  cellArray = .jnew("com/mathworks/toolbox/javabuilder/MWCellArray",
                    as.integer(rows),
                    as.integer(cols))

  for (i in 1:length(nvec)) {

    cellContent =
        if(is.double(nvec[i])) .jnew("java/lang/Double", as.double(nvec[i]))
        else .jnew("java/lang/Integer", as.integer(nvec[i]))

    index = .jarray(c(as.integer(i), as.integer(1)), "[I", dispatch = TRUE)
    .jcall(cellArray, "V", "set", index, .jcast(cellContent, "java/lang/Object"))
  }

  return (cellArray)
}

# Some data returned by the tclustIC function (namely, the IDXCLA and
# IDXMIX structures) is rendered in MATLAB as # n-by-m matrix of cell arrays with
# one element per row). This turns into a # very complex Java object mapping:
#
# In Java: Object[][] each element of which is a double[][1]
#
# When this data structure is returned to R, it is available as:
# - An array of Java object references,
#   - each element of which is a nested array of Java object references
#     - each element of which is an R list of single-element arrays.
#
# This functions is meant to (sort of) turn this mess into a matrix of R lists.
unwrapComplexNumericCellArray <- function(arr) {
  nRows = length(arr)
  nCols = length(arr[[1]])

  retVal = matrix(list(), nrow = nRows, ncol = nCols)

  for (i in 1:nRows) {
    row = .jevalArray(arr[[i]])
    for (j in 1:nCols) {
      l = .jevalArray(row[[j]])

##  VT::06.03.2019 - replace lapply() by sapply(). So, the elements of the returned
##      matrix of lists will contain numercial vectors and not lists of lists with one element.
##      See IDXMIX and IDXCLA.
##
##      l = lapply(l, function(x) {as.double(.jevalArray(x, simplify = TRUE))})
      l = sapply(l, function(x) {as.double(.jevalArray(x, simplify = TRUE))})

##  VT::06.03.2019 - when MATLAB returns strings as elements of the cell array
##      (see MIXMIXbs, etc. in tclustICsol), they will be transformed to numerical
##      arrays containing the byte values of the characters of the strings.
##      Concretely, tclustICsol() returns "true" or "spurious" as type of
##      solution in the last column of MIXMIXbs. When these strings represented
##      as byte arrays are rewarpped and passed to carbikeplot() they will
##      not be recognized.
##
##      It will be good to find a general solution, this is for now a workaround.
##
      if(is.logical(yes <- all.equal(strtoi(as.character(charToRaw("true")), 16L), as.vector(l))) && yes)
            l <- "true"
      else if(is.logical(yes <- all.equal(strtoi(as.character(charToRaw("spurious")), 16L), as.vector(l))) && yes)
            l <- "spurious"

      retVal[[i, j]] = l;
    }
  }

  return (retVal)
}

# rewrapComplexNumericCellArray <- function(arr) {
#   ## TODO: make sure arr is a bi-dimensional array of lists.
#   ## Otherwise return null
#
#   arrayConverter = new(J("org.jrc.ipsc.globesec.sitaf.fsda.ComplexArrayUtils"))
#   nRows = dim(arr)[1]
#   nCols = dim(arr)[2]
#   objArr = arrayConverter$create2dObjectArray(as.integer(nRows), as.integer(nCols))
#   for (i in 1:nRows) {
#     for (j in 1:nCols) {
#       doubleList = arr[i, j]
#       doubleJavaArray2 = .jarray(as.matrix(unlist(arr[[i,j]])), dispatch = TRUE)
#       # doubleJavaArray = arrayConverter$create2dDoubleArray(as.integer(length(doubleList[[1]])), as.integer(1))
#       # for (k in 1:length(doubleList[[1]])) {
#       #   retCode = arrayConverter$setDoubleArrayElement(doubleJavaArray, as.integer(k-1), as.integer(0), as.double(doubleList[[1]][[k]]))
#       # }
#       retCode = arrayConverter$setObjectArrayElement(objArr, as.integer(i-1), as.integer(j-1), doubleJavaArray2)
#     }
#   }
#
#   return (objArr)
# }

## Converts an R matrix of lists back into a Java-based MATLAB cell array
rewrapComplexNumericCellArray <- function(arr) {
  nRows = dim(arr)[1]
  nCols = dim(arr)[2]

  cellArray = .jnew("com/mathworks/toolbox/javabuilder/MWCellArray",
                    as.integer(nRows),
                    as.integer(nCols))

  for (i in 1:nRows) {
    for (j in 1:nCols) {
      doubleList = arr[i, j]

##  VT::06.03.2019 - if an element of the matrix is a list with length 0, it will be 'unlisted' to NULL
##  and the NULL will crash the as.matrix(). Therefore, if the list is with length 0,
##  create a matrix with 0 rows and 0 columns - this seems tow work
##
##      doubleJavaArray2 = .jarray(as.matrix(unlist(arr[[i,j]])), dispatch = TRUE)
      doubleJavaArray2 = if(length(arr[[i,j]]) == 0) .jarray(matrix(nrow=0, ncol=0), dispatch = TRUE)
                         else                        .jarray(as.matrix(unlist(arr[[i,j]])), dispatch = TRUE)

      index = .jarray(c(as.integer(i), as.integer(j)), "[I", dispatch = TRUE)
      .jcall(cellArray, "V", "set", index, .jcast(doubleJavaArray2, "java/lang/Object"))
    }
  }

  return (cellArray)
}

isJavaObject <- function(obj) {
  result <- tryCatch({
      obj %instanceof% "java.lang.Object"
    },
    error = function(cond) {
      return (FALSE)
    },
    warning = function(cond) {
      return (FALSE)
    },
    finally = {
    })

  return (result)
}

## VT::05.03.2019
## arr is a cell of 3D arrays. Convert the whole to a list of 3D arrays
##  This is used in tclusteda for the return value of SIGMA.
##
cell2list <- function(arr) {
  nRows = length(arr)
  nCols = length(arr[[1]])

  retVal = list()

  for(i in 1:nRows)
    retVal[i] <- .jevalArray(arr[[i]], "[[D", simplify=TRUE)

  return (retVal)
}
