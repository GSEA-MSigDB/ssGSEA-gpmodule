#  Introduction

**Single-sample GSEA (ssGSEA)**, an extension of **Gene Set Enrichment Analysis (GSEA)**, calculates separate enrichment scores for each pairing of a sample and gene set.  Each ssGSEA enrichment score represents the degree to which the genes in a particular gene set are coordinately up- or down-regulated within a sample.  The ssGSEA module for GenePattern is a free genomic analysis program written in the R language implementing this method in a form suitable for [GenePattern](http://www.genepattern.org/).

See the [module documentation](https://gsea-msigdb.github.io/ssGSEA-gpmodule/v10/index.html) for tips on usage.

# License

The ssGSEA module for GenePattern is made available under the terms of a BSD-style license, a copy of which is included in the distribution in the [LICENSE.txt](LICENSE.txt) file.  See that file for exact terms and conditions.

#  Latest Version

The latest binary release of this software can be obtained from the GenePattern module repository, available from the Administration screen of the web UI.  It is currently in Beta release as v9.x. 

If you have any comments, suggestions or bugs to report, please see our [Contact page](http://www.gsea-msigdb.org/gsea/contact.jsp) for information on how to reach us.

# History and Acknowledgments

**Version 9 of the module** was the open-source release; the initial GitHub commit corresponds to this release of August 7, 2017. The code revision history from the v8 and earlier releases is not available.
  
David Eby was responsible for the open-source conversion of the module and handles current maintenance and new feature development.  While David is listed on the initial commit to this public GitHub repository, original authorship is due to the individuals listed in the papers referenced in the [module documentation](docs/v10/index.html), regardless of the GitHub history metadata.

**With the release of v10.0.1**, this module was renamed from "ssGSEAProjection" to just "ssGSEA" for clarity and brevity, as it is commonly referred to by this name.  The underlying algorithm and code remain the same.

The GSEA project is currently a joint effort of the Broad Institute and the University of California San Diego, and funded by the National Cancer Institute of the National Institutes of Health (PI: JP Mesirov).

# Dependencies

The ssGSEA module is written in 100% pure R.  It has been tested on R-2.5, R-2.15, and R-3.2; running it with other versions of R may be possible but is unsupported. 

------
Copyright (c) 2012-2020 Broad Institute, Inc., Massachusetts Institute of Technology, and Regents of the University of California.  All rights reserved.
