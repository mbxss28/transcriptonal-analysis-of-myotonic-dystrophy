# Application of a transcriptional pipline to investigate myotonic dystrophy
Myotonic dystrophy 1 (DM1) is an autosomal dominant genetic disorder assoicated with the expansion of the expansion of the CTG repeat 3' of the UTR of the DMPK gene. This leads to a gain of function for the resulting mRNA transcript leading to the formation of RNA foci, resulting in dysregulation of alternate splicing as well as RAN translation.

This project aim to perform differential gene expression (DE) analysis on DM1 and amyotrophic lateral sclerosis (ALS) samples to determine biological pathways assocaited with DM1 pathology as well as to determine any similarites between pathways effected between DM1 and ALS.

For this, publically avilable data from four research papers where used with data downloaded from the [Genome eccession omnibus (GEO)](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi).

Below are the links to the different directories associated with analysis of specific papers. The order the papers are in is associated with the order the analyses where done.

[Paper 1](https://github.com/mbxss28/transcriptonal-analysis-of-myotonic-dystrophy/tree/main/Paper%201) 

[Paper 2](https://github.com/mbxss28/transcriptonal-analysis-of-myotonic-dystrophy/tree/main/Paper%202)

[Paper 3](https://github.com/mbxss28/transcriptonal-analysis-of-myotonic-dystrophy/tree/main/Paper%203)

[Paper4](https://github.com/mbxss28/transcriptonal-analysis-of-myotonic-dystrophy/tree/main/Paper%204)

![alt text](https://github.com/mbxss28/transcriptonal-analysis-of-myotonic-dystrophy/blob/main/Analysis%20pipeline2.png)

Created in [https://BioRender.com](https://BioRender.com) A broad overview of the analysis pipline used for this project.

| Tool |           Function |         Citation |            
| ------------- | ------------- | -------------  |
| SeqKit  | Download Fastq files  |Shen, W., Le, S., Li, Y. and Hu, F., 2016. SeqKit: a cross-platform and ultrafast toolkit for FASTA/Q file manipulation. PloS one, 11(10), p.e0163962.                |
| Fastp  | Used to check quality of Fastq files and automatically produced trimmed files  |Chen, S., Zhou, Y., Chen, Y. and Gu, J., 2018. fastp: an ultra-fast all-in-one FASTQ preprocessor. Bioinformatics, 34(17), pp.i884-i890.  |
| Salmon       | Used to quantify gene expression  for DE analysis         | Patro, R., Duggal, G., Love, M.I., Irizarry, R.A. and Kingsford, C., 2017. Salmon provides fast and bias-aware quantification of transcript expression. Nature methods, 14(4), pp.417-419.                      |
| tximport            |  Used to import Salmon results into R                  |  Soneson, C., Love, M.I. and Robinson, M.D., 2016. Differential analyses for RNA-seq: transcript-level estimates improve gene-level inferences. F1000Research, 4, p.1521.                     |
|Tidyverse                     | Used for the filtering and converting data into dataframes                        |Wickham, H., Averick, M., Bryan, J., Chang, W., McGowan, L.D.A., François, R., Grolemund, G., Hayes, A., Henry, L., Hester, J. and Kuhn, M., 2019. Welcome to the Tidyverse. Journal of open source software, 4(43), p.1686.                          |
|AnnotationHub                      | Used to access AnnotationHub database to get ensemble data                         |Morgan M, Shepherd L (2024). AnnotationHub: Client to access AnnotationHub resources. doi:10.18129/B9.bioc.AnnotationHub https://doi.org/10.18129/B9.bioc.AnnotationHub, R package version 3.14.0, https://bioconductor.org/packages/AnnotationHub.                    |
| ensembldb                              | Used to manipulate the annotation data downloaded from AnnotationHub    | Rainer, J., Gatto, L. and Weichenberger, C.X., 2019. ensembldb: an R package to create and use Ensembl-based annotation resources. Bioinformatics, 35(17), pp.3151-3153. |
| txbmaker  |    Used to create TxDb for later differential expression analysis, alongside converting transcript IDs to geneIDs| Pagès H, Carlson M, Aboyoun P, Falcon S, Morgan M (2025). txdbmaker: Tools for making TxDb objects from genomic annotations. doi:10.18129/B9.bioc.txdbmaker, R package version 1.4.1, https://bioconductor.org/packages/txdbmaker.|


