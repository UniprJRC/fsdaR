saveas <- function(fig, fname, format="jpg")
{
    if(missing(fig))
        fig <- "gcf"
    if(missing(fname))
        fname <- "some.jpg"

##    if(missing(format))       #seems that format is a must argument
##        parlist = c(rType2MatlabType("fig", fig),
##                    rType2MatlabType("fname", fname))
##    else
        parlist = c(rType2MatlabType("fig", fig),
                    rType2MatlabType("fname", fname),
                    rType2MatlabType("format", format))

    out <- callFsdaFunction("saveFigureAs", "[Ljava/lang/Object;", 1, parlist)

    if(is.null(out))
        return(NULL)

    return(out[[1]]$getInt())
}
