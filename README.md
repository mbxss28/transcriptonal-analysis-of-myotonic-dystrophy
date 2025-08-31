# Application of a transcriptional pipline to investigate myotonic dystrophy
Myotonic dystrophy 1 (DM1) is an autosomal dominant genetic disorder assoicated with the expansion of the expansion of the CTG repeat 3' of the UTR of the DMPK gene. This leads to a gain of function for the resulting mRNA transcript leading to the formation of RNA foci, resulting in dysregulation of alternate splicing as well as RAN translation.

This project aim to perform differential gene expression (DE) analysis on DM1 and amyotrophic lateral sclerosis (ALS) samples to determine biological pathways assocaited with DM1 pathology as well as to determine any similarites between pathways effected between DM1 and ALS.

For this, publically avilable data from three research papers where used with data downloaded from the [Genome eccession omnibus (GEO)](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi).


### Datasets
Paper - 1 came from the analysis of transcriptome alterations of individuals effected by myotonic dystrophy (Otero et al, 2021). 
For this analysis only the DM1 and unaffected samples where use. 

Link to Fastq files used [GSE157428](https://www.ncbi.nlm.nih.gov/Traces/study/?acc=PRJNA661286&o=acc_s%3Aa)

Paper 2 - Transcriptional analysis of C9orf72-associated ALS. A form of ALS caused by a hexanucleotide GGGGGG repeat expansion in the C9orf72 gene (Prudencio M et al., 2015).
For this analysis only healthy and ALS samples from the frontal cortex where used for a better comparison to Paper 1

Link to Fastq files used [GSE67196](https://www.ncbi.nlm.nih.gov/Traces/study/?acc=PRJNA279249)

Paper 3 - Analysis of the effect that myotonic dystrophy 1 has on the choroid plexus, the part of the brain responsible for the creation of cerebral spinal fluid(Nutter C.A et al., 2023). For this analysis only the DM1 and Unaffected samples where used.

Link to the Fastq files used [GSE228458](https://www.ncbi.nlm.nih.gov/Traces/study/?acc=PRJNA949954&o=acc_s%3Aa)

## Analysis pipeline

![alt text](https://github.com/mbxss28/transcriptonal-analysis-of-myotonic-dystrophy/blob/main/Analysis%20pipeline2.png)

Created in [https://BioRender.com](https://BioRender.com) A broad overview of the analysis pipline used for this project.


### Getting the data

list of tools used to download and check quality of fastq files.
|    Tool       |    Function   |   Citation     |            
| ------------- | ------------- | -------------  |
| Seqkit | Used to download fastq files from the GEO|Shen, W., Le, S., Li, Y. and Hu, F., 2016. SeqKit: a cross-platform and ultrafast toolkit for FASTA/Q file manipulation. PloS one, 11(10), p.e0163962. |                  
| Fastp    |  Used to check quality of Fastq files and automatically produced trimmed files |Chen, S., Zhou, Y., Chen, Y. and Gu, J., 2018. fastp: an ultra-fast all-in-one FASTQ preprocessor. Bioinformatics, 34(17), pp.i884-i890. |

Link to Quality report for fastq file produced from fastp
[FastpQC reports](https://github.com/mbxss28/transcriptonal-analysis-of-myotonic-dystrophy/tree/main/Fastp_QC)

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
| G:Profiler   |Mainly used to converted filtered list of ensemble gene IDss to gene symnol IDs|Liis Kolberg, Uku Raudvere, Ivan Kuzmin, Priit Adler, Jaak Vilo, Hedi Peterson: g:Profiler—interoperable web service for functional enrichment analysis and gene identifier mapping (2023 update) Nucleic Acids Research, May 2023; doi:10.1093/nar/gkad347|
|annotate |Used to convert the gene symbol IDs into entrez ids. Necessary for over-representaion analysis and KEGG enrichment analysis.|Gentry J (2025). annotate: Annotation for microarrays. doi:10.18129/B9.bioc.annotate, R package version 1.87.0, https://bioconductor.org/packages/annotate.|
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


Link to BAM quality reports produced from Qualimap
[BAMQC](https://github.com/mbxss28/transcriptonal-analysis-of-myotonic-dystrophy/tree/main/BAM_QC)

Link to all of the bash scripts used to download and analysis data before importing into R.
[Bash Scripts](https://github.com/mbxss28/transcriptonal-analysis-of-myotonic-dystrophy/tree/main/Scripts)

Link to Rscripts and csv files showing the results of the differential gene expression analysis. 
[DE](https://github.com/mbxss28/transcriptonal-analysis-of-myotonic-dystrophy/tree/main/DE)

Link to directory for the R scripts used for the AS analysis and csv files of list of differentially spliced genes.
[AS](https://github.com/mbxss28/transcriptonal-analysis-of-myotonic-dystrophy/tree/main/AS)

### Citations for papers used for analysis
Nutter, C.A., Kidd, B.M., Carter, H.A., Hamel, J.I., Mackie, P.M., Kumbkarni, N., Davenport, M.L., Tuyn, D.M., Gopinath, A., Creigh, P.D. and Sznajder, Ł.J., 2023. Choroid plexus mis-splicing and altered cerebrospinal fluid composition in myotonic dystrophy type 1. Brain, 146(10), pp.4217-4232.

Otero, B.A., Poukalov, K., Hildebrandt, R.P., Thornton, C.A., Jinnai, K., Fujimura, H., Kimura, T., Hagerman, K.A., Sampson, J.B., Day, J.W. and Wang, E.T., 2021. Transcriptome alterations in myotonic dystrophy frontal cortex. Cell reports, 34(3).

Prudencio, M., Belzil, V.V., Batra, R., Ross, C.A., Gendron, T.F., Pregent, L.J., Murray, M.E., Overstreet, K.K., Piazza-Johnston, A.E., Desaro, P. and Bieniek, K.F., 2015. Distinct brain transcriptome profiles in C9orf72-associated and sporadic ALS. Nature neuroscience, 18(8), pp.1175-1182.


# Final Notes

If installing rMATS using conda and you encounter any issues try going into the .condarc file and removing the "channel-prioity disabled" option and then installing rmats.

Some of the file names in the scripts provided may not corraspond to the paper numbers mentioned earlier. The reason for this is that even though three papers where used for the final analysis, in total five where looked at but two not included.


