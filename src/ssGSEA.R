# Copyright (c) 2012-2020 Broad Institute, Inc., Massachusetts Institute of Technology, and Regents of the University of California.  All rights reserved.

# ssGSEA

# processes the cmd line for the ssGSEA.project.dataset
ssGSEA.cmdline <- function(...)
{
    input.gct.filename               <- NA
    output.prefix                    <- NA
    gene.sets.db.list.filename       <- NA
    gene.symbol.column               <- "Name"
    gene.set.selection               <- "ALL"
    sample.normalization.method      <- "none"
    weighting.exponent               <- 0.75
    min.overlap                      <- 1
    combine.mode                     <- "combine.all"

    args <- list(...)
    for (i in 1:length(args[[1]]))
    {
        arg <- args[[1]][i]
        flag <- substring(arg, 1, 2)
        value <- substring(arg, 3, nchar(arg))

        if (value == '')
        {
            next
        }
        else if (flag == '-l')
        {
            libdir <- value
        }
        else if (flag == '-i')
        {
            input.gct.filename <- value
        }
        else if (flag == '-o')
        {
            output.prefix <- value
        }
        else if (flag == '-D')
        {
            gene.sets.db.list.filename <- value
        }
        else if (flag == '-c')
        {
            gene.symbol.column <- value
        }
        else if (flag == '-s')
        {
            gene.set.selection <- unlist(strsplit(value,','))
        }
        else if (flag == '-n')
        {
            sample.normalization.method <- value
        }
        else if (flag == '-w')
        {
            weighting.exponent <- as.numeric(value)
        }
        else if (flag == '-v')
        {
            min.overlap <- as.integer(value)
        }
        else if (flag == '-C')
            combine.mode <- value
        else
            stop("Unknown option", flag)

    }

    if (is.na(input.gct.filename))
        stop("Missing input.gct.filename")

    if (is.na(output.prefix))
    {
        temp <- strsplit(input.gct.filename, split="/") # Extract input file name
        s <- length(temp[[1]])
        input.file.name <- temp[[1]][s]
        temp <- strsplit(input.file.name, split=".gct")
        output.prefix <-  paste(temp[[1]][1],".PROJ", sep="")
    }

    gene.sets.dbfile.list <- NA

    if (!is.na(gene.sets.db.list.filename)) {
        gene.sets.dbfile.list <- readLines(gene.sets.db.list.filename)
    }
    else {
        stop("No Gene Set DB files provided")
    }

    setup(libdir)
    source(file.path(libdir,"ssGSEA.Library.R"))

    suppressWarnings(ssGSEA.project.dataset(input.gct.filename,
                                            paste(output.prefix, ".gct", sep=""),
                                            gene.sets.dbfile.list = gene.sets.dbfile.list,
                                            gene.symbol.column = gene.symbol.column,
                                            gene.set.selection = gene.set.selection,
                                            sample.norm.type = sample.normalization.method,
                                            weight = weighting.exponent,
                                            min.overlap = min.overlap,
                                            combine.mode = combine.mode))
}

setup <- function(libdir)
{
    source(file.path(libdir,"common.R"))
    setLibPath(libdir)
    install.required.packages(libdir)
}

install.required.packages <- function(libdir)
{
    info(libdir)
    # no non-base packages required by this module
}

# Call the command-line function, passing the args from GenePattern
ssGSEA.cmdline(commandArgs(trailingOnly=T))
