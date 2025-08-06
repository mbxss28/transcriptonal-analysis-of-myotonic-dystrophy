# Application of a transcriptional pipline to investigate myotonic dystrophy
Myotonic dystrophy 1 (DM1) is an autosomal dominant genetic disorder assoicated with the expansion of the expansion of the CTG repeat 3' of the UTR of the DMPK gene. This leads to a gain of function for the resulting mRNA transcript leading to the formation of RNA foci, resulting in dysregulation of alternate splicing as well as RAN translation.

This project aim to perform differential gene expression (DE) analysis on DM1 and amyotrophic lateral sclerosis (ALS) samples to determine biological pathways assocaited with DM1 pathology as well as to determine any similarites between pathways effected between DM1 and ALS.

For this, publically avilable data from four research papers where used with data downloaded from the [Genome eccession omnibus (GEO)](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi).

Below are the links to the different directories associated with analysis of specific papers. The order the papers are in is associated with the order the analyses where done.

[Paper 1](https://github.com/mbxss28/transcriptonal-analysis-of-myotonic-dystrophy/tree/main/Paper%201) 

[Paper 2](https://github.com/mbxss28/transcriptonal-analysis-of-myotonic-dystrophy/tree/main/Paper%203)

[Paper3](https://github.com/mbxss28/transcriptonal-analysis-of-myotonic-dystrophy/tree/main/Paper%203)


## Analysis pipeline

![alt text](https://github.com/mbxss28/transcriptonal-analysis-of-myotonic-dystrophy/blob/main/Analysis%20pipeline2.png)

Created in [https://BioRender.com](https://BioRender.com) A broad overview of the analysis pipline used for this project.


### Getting the data

list of tools used to download and check quality of data.
|    Tool       |    Function   |   Citation     |            
| ------------- | ------------- | -------------  |
| Seqkit | Used to download fastq files from the GEO|Shen, W., Le, S., Li, Y. and Hu, F., 2016. SeqKit: a cross-platform and ultrafast toolkit for FASTA/Q file manipulation. PloS one, 11(10), p.e0163962. |                  
| Fastp    |  Used to check quality of Fastq files and automatically produced trimmed files |Chen, S., Zhou, Y., Chen, Y. and Gu, J., 2018. fastp: an ultra-fast all-in-one FASTQ preprocessor. Bioinformatics, 34(17), pp.i884-i890. |


### Differental gene expression analysis

List of all the tools, reason they where used and accompanying citation for the differential gene expression analysis. 

| Tool |           Function |         Citation |            
| ------------- | ------------- | -------------  |
| Salmon       | Used to quantify gene expression  for DE analysis         | Patro, R., Duggal, G., Love, M.I., Irizarry, R.A. and Kingsford, C., 2017. Salmon provides fast and bias-aware quantification of transcript expression. Nature methods, 14(4), pp.417-419.                      |
| tximport            |  Used to import Salmon results into R                  |  Soneson, C., Love, M.I. and Robinson, M.D., 2016. Differential analyses for RNA-seq: transcript-level estimates improve gene-level inferences. F1000Research, 4, p.1521.                     |
|Tidyverse                     | Used for the filtering and converting data into dataframes                        |Wickham, H., Averick, M., Bryan, J., Chang, W., McGowan, L.D.A., François, R., Grolemund, G., Hayes, A., Henry, L., Hester, J. and Kuhn, M., 2019. Welcome to the Tidyverse. Journal of open source software, 4(43), p.1686.                          |
|AnnotationHub                      | Used to access AnnotationHub database to get ensemble data                         |Morgan M, Shepherd L (2024). AnnotationHub: Client to access AnnotationHub resources. doi:10.18129/B9.bioc.AnnotationHub https://doi.org/10.18129/B9.bioc.AnnotationHub, R package version 3.14.0, https://bioconductor.org/packages/AnnotationHub.                    |
| ensembldb                              | Used to manipulate the annotation data downloaded from AnnotationHub    | Rainer, J., Gatto, L. and Weichenberger, C.X., 2019. ensembldb: an R package to create and use Ensembl-based annotation resources. Bioinformatics, 35(17), pp.3151-3153. |
| txbmaker  |    Used to create TxDb for later differential expression analysis, alongside converting transcript IDs to geneIDs| Pagès H, Carlson M, Aboyoun P, Falcon S, Morgan M (2025). txdbmaker: Tools for making TxDb objects from genomic annotations. doi:10.18129/B9.bioc.txdbmaker, R package version 1.4.1, https://bioconductor.org/packages/txdbmaker.|
|Deseq2 | Used to determine significantly differentially expressed genes|Deseq2 - Love, M.I., Huber, W. and Anders, S., 2014. Moderated estimation of fold change and dispersion for RNA-seq data with DESeq2. Genome biology, 15, pp.1-21.|
|EnhancedVolcano |Used for the generation of volcano plots of differentially expressed genes |Blighe, K, S Rana, and M Lewis. 2018. “EnhancedVolcano: Publication-ready volcano plots with enhanced colouring and labeling.” https://github.com/kevinblighe/EnhancedVolcano. |
|Pheatmap    | Used for the generation of heatmaps to help check quality of data.  |Kolde R (2025). pheatmap: Pretty Heatmaps. R package version 1.0.13, https://github.com/raivokolde/pheatmap.  |
| G:Profiler   |Mainly used to converted filtered list of ensemble gene IDss to to gene symnol IDs|Liis Kolberg, Uku Raudvere, Ivan Kuzmin, Priit Adler, Jaak Vilo, Hedi Peterson: g:Profiler—interoperable web service for functional enrichment analysis and gene identifier mapping (2023 update) Nucleic Acids Research, May 2023; doi:10.1093/nar/gkad347|
|annotate |Used to convert the gene symbol IDs into entrez ids. Necessary for some aspects of the enrichment analysis.|Gentry J (2025). annotate: Annotation for microarrays. doi:10.18129/B9.bioc.annotate, R package version 1.87.0, https://bioconductor.org/packages/annotate.|
| ClusterProfiler  | Used to perform Gene Set Enrichment Analysis(GSEA), enrichment analysis and Kegg enrichment analysis.|Clusterprofiler - Yu, G., Wang, L.G., Han, Y. and He, Q.Y., 2012. clusterProfiler: an R package for comparing biological themes among gene clusters. Omics: a journal of integrative biology, 16(5), pp.284-287.|
|pathview |Used to view the Kegg pathways found to be enriched by ClusterProfiler.|Luo, Weijun, Brouwer, Cory (2013). “Pathview: an R/Bioconductor package for pathway-based data integration and visualization.” Bioinformatics, 29(14), 1830-1831. doi:10.1093/bioinformatics/btt285.|


### Alternate splicing analysis
List of tools used, their function and and accompanying citation for the Alternate splicing/differential exon usage analysis. 

| Tool          |   Function    |   Citation     |            
| ------------- | ------------- | -------------  |
|STAR |Used to alignment trimmed fastq files again reference genome|Dobin, A., Davis, C.A., Schlesinger, F., Drenkow, J., Zaleski, C., Jha, S., Batut, P., Chaisson, M. and Gingeras, T.R., 2013. STAR: ultrafast universal RNA-seq aligner. Bioinformatics, 29(1), pp.15-21.|
|Samtools |Used to generate oveview of the quality of alignments produced from STAR. Also used in cases that STAR bamsorted parameter failed to produce sorted bam file  from unsorted bam file |Li, H., Handsaker, B., Wysoker, A., Fennell, T., Ruan, J., Homer, N., Marth, G., Abecasis, G., Durbin, R. and 1000 Genome Project Data Processing Subgroup, 2009. The sequence alignment/map format and SAMtools. bioinformatics, 25(16), pp.2078-2079. |
|Qualimap | Used to generate more indepth analysis of alignment quality, that produces graphs.|Okonechnikov, K., Conesa, A. and García-Alcalde, F., 2016. Qualimap 2: advanced multi-sample quality control for high-throughput sequencing data. Bioinformatics, 32(2), pp.292-294.|
|rMATS|Used to measure significantly dysregulated genes between samples.|  Shen, S., Park, J.W., Lu, Z.X., Lin, L., Henry, M.D., Wu, Y.N., Zhou, Q. and Xing, Y., 2014. rMATS: robust and flexible detection of differential alternative splicing from replicate RNA-Seq data. Proceedings of the national academy of sciences, 111(51), pp.E5593-E5601.|
|rmatsplot |Used to generate plots from the results of rMATs |https://github.com/Xinglab/rmats2sashimiplot|

# Final Notes

If installing rMATS using conda and you encounter any issues try going into the .condarc file and removing the "channel-prioity disabled" option and then installing rmats.

Some of the file names in the scripts provided may not corraspond to the paper numbers mentioned earlier. The reason for this is that even though three papers where used for the final analysis, in total five where looked at but two not included.


