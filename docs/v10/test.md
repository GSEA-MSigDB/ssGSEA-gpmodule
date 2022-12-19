# ssGSEA (v10.1.x)

Performs single sample GSEA

**Author:** GenePattern

**Contact:**

[Contact the GenePattern
team](http://software.broadinstitute.org/cancer/software/genepattern/contact)
for GenePattern issues.

[See the GSEA forum](https://groups.google.com/forum/#!forum/gsea-help)
for GSEA questions.

**Algorithm Version:**

## Description

Project each sample within a data set onto a space of gene set
enrichment scores using the ssGSEA projection methodology described in
Barbie et al., 2009.

## Summary

Single-sample GSEA (ssGSEA), an extension of Gene Set Enrichment
Analysis (GSEA), calculates separate enrichment scores for each pairing
of a sample and gene set. Each ssGSEA enrichment score represents the
degree to which the genes in a particular gene set are coordinately up-
or down-regulated within a sample.

**NOTE:** with the release of v10.0.1, this module was renamed from
"ssGSEAProjection" to just "ssGSEA".

## Discussion

When analyzing genome-wide transcription profiles from microarray data,
a typical goal is to find genes significantly differentially correlated
with distinct sample classes defined by a particular phenotype (e.g.,
tumor vs. normal). These findings can be used to provide insights into
the underlying biological mechanisms or to classify (predict the
phenotype of) a new sample. Gene Set Enrichment Analysis (GSEA)
addressed this problem by evaluating whether a priori defined sets of
genes, associated with particular biological processes (such as
pathways), chromosomal locations, or experimental results are enriched
at either the top or bottom of a list of differentially expressed genes
ranked by some measure of differences in a gene’s expression across
sample classes. Examples of ranking metrics are fold change for
categorical phenotypes (e.g., tumor vs. normal) and Pearson correlation
for continuous phenotypes (e.g., age). Enrichment provides evidence for
the coordinate up- or down-regulation of a gene set’s members and the
activation or repression of some corresponding biological process.

Where GSEA generates a gene set’s enrichment score with respect to
phenotypic differences across a collection of samples within a dataset,
ssGSEA calculates a separate enrichment score for each pairing of sample
and gene set, independent of phenotype labeling. In this manner, ssGSEA
transforms a single sample's gene expression profile to a *gene
set* enrichment profile. A gene set's enrichment score represents the
activity level of the biological process in which the gene set's members
are coordinately up- or down-regulated. This transformation allows
researchers to characterize cell state in terms of the activity levels
of biological processes and pathways rather than through the expression
levels of individual genes.

In working with the transformed data, the goal is to find biological
processes that are differentially active across the phenotype of
interest and to use these measures of process activity to characterize
the phenotype. Thus, the benefit here is that the ssGSEA projection
transforms the data to a higher-level (pathways instead of genes) space
representing a more biologically interpretable set of features on which
analytic methods can be applied.

As a practical matter, ssGSEA essentially reduces the dimensionality of
the set. You can look for correlations between the gene set enrichment
scores and the phenotype of interest (e.g., tumor vs. normal) using the
GCT output with a module like ComparativeMarkerSelection. You
could also try clustering the data set; whichever gene sets stand out
as strong predictors of the phenotype of interest, specific clusters can
then be mapped to biochemical pathways, giving you insight into what is
driving the phenotype of interest.

While the GCT can be passed along to any module accepting that format,
it does not make sense to run it through GSEA.

This module implements the single-sample GSEA projection methodology
described in Barbie et al, 2009.

**NOTE:** with the release of v10.0.1, this module was renamed from
"ssGSEAProjection" to just "ssGSEA" for clarity and brevity, as it is
commonly referred to by this name. The underlying algorithm and code
remain the same.

## References

1.  Subramanian A, Tamayo P, Mootha VK, Mukherjee S, Ebert BL, Gillette
    MA, Paulovich A, Pomeroy SL, Golub TR, Lander ES, Mesirov JP. Gene
    set enrichment analysis: A knowledge-based approach for interpreting
    genome-wide expression profiles. *PNAS*. 2005;102(43):15545-15550.
    <http://www.pnas.org/content/102/43/15545.abstract>
2.  Barbie DA, Tamayo P, et al. Systematic RNA interference reveals that
    oncogenic KRAS-driven cancers require TBK1. *Nature*.
    2009;462:108-112.

## Parameters

- **Input gct file**<span style="color:red;">*</span>
    - [GCT]("http://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats#GCT:_Gene_Cluster_Text_file_format_.28.2A.gct.29") file containing input dataset’s gene expression data.</td>
- **Output file prefix**
    - The prefix used for the name of the output GCT file. If unspecified, output prefix will be set to &lt;prefix of input GCT file&gt;.PROJ. The output GCT file will contain the projection of input dataset onto a space of gene set enrichments scores.
- **Gene sets database files**<span style="color:red;">*</span>
    - This parameter's drop-down allows you to select gene sets from the [Molecular Signatures Database (MSigDB)](http://www.gsea-msigdb.org/gsea/msigdb/index.jsp) on the GSEA website. This drop-down provides access to only the most current version of MSigDB. You can also upload your own gene set file(s) in [GMT](https://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats#GMT:_Gene_Matrix_Transposed_file_format_.28.2A.gmt.29), [GMX](https://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats#GMX:_Gene_MatriX_file_format_.28.2A.gmx.29), or [GRP](https://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats#GRP:_Gene_set_file_format_.28.2A.grp.29) format.
    - If you want to use files from an earlier version of MSigDB you will need to download them from the archived releases on the [website](http://www.gsea-msigdb.org/gsea/downloads.jsp).
- **Gene symbol column**<span style="color:red;">*</span>
    - Input GCT file column containing gene symbol names. In most cases, this will be column 1. (default: *Column 1*)
- **Gene set selection**<span style="color:red;">*</span>
    - Comma-separated list of gene set names on which to project the input expression data. Alternatively, this field may be set to <em>ALL</em>, indicating that the input expression dataset is to be projected to all gene sets defined in the specified gene set database(s). (default: *ALL*)
- **Sample normalization method**<span style="color:red;">*</span>
    - Normalization method applied to expression data (if the option *"none"* is selected, data will not be normalized). Supported methods are *none*, *rank*, *log.rank*, and *log*. (Default: *none*)
- **Weighting exponent**<span style="color:red;">*</span>
    - Exponential weight employed in calculation of enrichment scores. The default value of 0.75 was selected after extensive testing. The module authors strongly recommend against changing from default. (Default: *0.75*)
- **Min gene set size**<span style="color:red;">*</span>
    - Exclude from the projection gene sets whose overlap with the genes listed in the input GCT file are less than this value. (Default: 10)
- **Combine mode**<span style="color:red;">*</span>
    - Options for combining enrichment scores for paired _UP and _DN gene sets. (Default: *combine.add*)
    - For gene set collections that do not utilize _UP and _DN suffixes at the ends of set names, the *combine mode* parameter option is irrelevant as all the modes give the same output. 
    - For Gene set collections that utilize _UP and _DN suffixes, which include MSigDB v5's *C2.all*, *C2.CGP*, *C6.all*, and *C7.all*, recombine sets in two different ways:
      - *Combine.add* mode [default] keeps the original paired sets with independent scores and adds the new combined set with combined score to the output file, increasing the number of gene sets by the number of paired sets. 
      - *Combine.replace* replaces the original paired gene sets with a new combined gene set and thus reduces the number of gene sets in the output by half the paired sets. Combined sets report combined enrichment scores. 
      - *Combine.off* keeps _UP and _DN sets separate.

<span style="color:red;">*</span> = required

## Input Files

1. Input expression dataset 

The GCT file containing the input dataset’s gene expression data
(see [the GCT file format information](<https://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats#GCT:_Gene_Cluster_Text_file_format_.28.2A.gct.29>)).
Gene symbols are typically listed in the column with header *Name*;
however, GCT files containing RNAi data may list the gene symbol
name in alternative columns. The “gene symbol column name”
parameter specifies which of the input GCT file’s columns contains
the gene symbols.  
      
The input GCT file’s row identifiers must draw from the same family
of gene identifiers (the same ontology or name space, such as HUGO
Gene Nomenclature) as those used to identify genes in the gene sets
database file (see next item below). Typically these are human gene
symbols.  
      
If a GCT file’s row identifiers are probe IDs, and gene sets are
defined through a list of human gene symbols, it will be necessary
to collapse all probe set expression values for a given gene into a
single expression value and use a human gene symbol to represent
that gene. The CollapseDataset GenePattern module can make this
transformation.

2. Gene sets database files
      
One or more optional GMT or GMX file containing a collection of gene
set definitions (see [the GMT file
format](https://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats#GMT:_Gene_Matrix_Transposed_file_format_.28.2A.gmt.29) and 
[the GMX file format](https://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats#GMX:_Gene_MatriX_file_format_.28.2A.gmx.29) in the GenePattern file formats documentation).  

## Output Files

1.  Output enrichment score dataset  
      
A GCT file containing the input dataset’s projection onto a space of
specified gene sets. This GCT file may serve as input into
GenePattern’s many clustering and classification algorithms. 

In the case of experimentally derived gene sets with \_UP and \_DN
suffixes appended to otherwise identical gene set names, *combine modes*
of *combine.add* and *combine.replace* will either add to the set or
replace the original gene set pair with a combined gene set with the
suffix removed from the name thereby creating new gene set names that
may impact downstream applications using these files in combination with
the original gene set collection file. Check that downstream
applications utilize subsets of gene sets within a collection for
compatibility with the *combine.add* mode output.

## Platform Dependencies

**Task Type:**  
Projection

**CPU Type:**  
any

**Operating System:**  
any

**Language:**  
R-3.2

## Version Comments

- **10.1.0** (2022-10-2): Updated to Human MSigDB v2022.1.Hs and Mouse MSigDB 2022.1.Mm.
- **10.0.12** (2022-9-15): Updated to Human MSigDB v2022.1.Hs. Direct support for Mouse MSigDB 2022.1.Mm is not yet available.
- **10.0.11** (2022-1-19): Updated to MSigDB v7.5.1.
- **10.0.10** (2022-1-12): Updated to MSigDB v7.5.
- **10.0.9** (2021-4-22): Fixed minor typo.
- **10.0.8** (2021-4-2): Updated to MSigDB v7.4.
- **10.0.7** (2021-3-23): Updated to MSigDB v7.3.
- **10.0.6** (2020-12-16): Fix for single sample GCT files and single set GMX files.
- **10.0.5** (2020-12-15): Fix for single sample GCT files.
- **10.0.4** (2020-9-23): Updated to MSigDB v7.2.
- **10.0.3** (2020-4-2): Updated to MSigDB v7.1.
- **10.0.2** (2020-3-10): Renamed from ssGSEAProjection. Updated to R-3.2. Documentation updates.
- **10.0.1** (2020-2-26): Renamed from ssGSEAProjection. Updated to R-3.2.
- **9.1.2** (2019-10-16): Updated to give access to MSigDB v7.0. Unified the Gene Set DB selector parameters and better downloading of MSigDB files. Removed Java dependency. Added a no-normalize option as the default.
- **8** (2017-05-18): Updated to give access to MSigDB v6.0. Updated to use GenePattern native file lists. Fixes a bug to improve certain error messages. 
- **7** (2016-02-04): Updated to give access to MSigDB v5.1. Updated to R-2.15 and made fixes for portability.
- **6** (2015-06-16): Add built-in support for MSigDB v5.0, which includes new hallmark gene sets.
- **5** (2014-08-11): Added combine mode parameter.
- **4** (2013-06-17): Updated list of gene sets to include v4.0 MSigDB collections. 
- **3** (2013-02-15): Updated list of gene sets databases to include v3.1 MSigDB collection, updated FTP download code, made documentation more biologist-friendly. 
- **2** (2012-09-19): Added support for reading of gmx-formatted gene set description files.
- **1** (2012-07-03)

Copyright © 2003-2020 Broad Institute, Inc., Massachusetts Institute of
Technology, and Regents of the University of California. All rights
reserved.

