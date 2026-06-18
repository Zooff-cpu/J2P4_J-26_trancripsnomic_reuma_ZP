setwd("c:/Users/mindert/OneDrive - NHL Stenden/J2/Periode 4/Transciptnomics/Transcriptnomics real/Data_RA_raw/")
setwd
install.packages('BiocManager')
# Package downloaden
BiocManager::install('Rsubread')
# Package laden
library(Rsubread)
library(Biomanager)
buildindex(
  basename = 'ref_reuma',
  reference = 'Data_RA_raw/GCF_000001405.40_GRCh38.p14_genomic.fna',
  memory = 4000,
  indexSplit = TRUE)

align.ctrl_01 <- align(index = "ref_reuma", readfile1 = "Ruwe_data_genoom/SRR4785819_1_subset40k.fastq", readfile2 = "Ruwe_data_genoom/SRR4785819_2_subset40k.fastq",  output_file = "ctrl_01.BAM")

align.ctrl_02 <- align(index = "ref_reuma", readfile1 = "Ruwe_data_genoom/SRR4785820_1_subset40k.fastq", readfile2 = "Ruwe_data_genoom/SRR4785820_2_subset40k.fastq",  output_file = "ctrl_02.BAM")

align.ctrl_03 <- align(index = "ref_reuma", readfile1 = "Ruwe_data_genoom/SRR4785828_1_subset40k.fastq", readfile2 = "Ruwe_data_genoom/SRR4785828_2_subset40k.fastq",  output_file = "ctrl_03.BAM")

align.ctrl_04 <- align(index = "ref_reuma", readfile1 = "Ruwe_data_genoom/SRR4785831_1_subset40k.fastq", readfile2 = "Ruwe_data_genoom/SRR4785831_2_subset40k.fastq",  output_file = "ctrl_04.BAM")

align.ra_01 <- align(index = "ref_reuma", readfile1 = "Ruwe_data_genoom/SRR4785979_1_subset40k.fastq", readfile2 = "Ruwe_data_genoom/SRR4785979_2_subset40k.fastq",  output_file = "ra_01.BAM")

align.ra_02 <- align(index = "ref_reuma", readfile1 = "Ruwe_data_genoom/SRR4785980_1_subset40k.fastq", readfile2 = "Ruwe_data_genoom/SRR4785980_2_subset40k.fastq",  output_file = "ra_02.BAM")

align.ra_03 <- align(index = "ref_reuma", readfile1 = "Ruwe_data_genoom/SRR4785986_1_subset40k.fastq", readfile2 = "Ruwe_data_genoom/SRR4785986_2_subset40k.fastq",  output_file = "ra_03.BAM")

align.ra_04 <- align(index = "ref_reuma", readfile1 = "Ruwe_data_genoom/SRR4785988_1_subset40k.fastq", readfile2 = "Ruwe_data_genoom/SRR4785988_2_subset40k.fastq",  output_file = "ra_04.BAM")

# Laad Rsamtools voor sorteren en indexeren (dowloaden indien nodig)
BiocManager::install('Rsamtools')
library(Rsamtools)


# Bestandsnamen van de monsters
samples <- c('ctrl_01.BAM', 'ctrl_02.BAM', 'ctrl_03.BAM', 'ctrl_04.BAM', 'ra_01.BAM', 'ra_02.BAM', 'ra_03.BAM', 'ra_04.BAM')

#count matrix maken
count_matrix <- featureCounts(
  files = samples,
  annot.ext = "Humaan_reuma.gtf",
  isPairedEnd = TRUE,
  isGTFAnnotationFile = TRUE, 
  GTF.featureType = "gene",
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE
)

#countr matrix bekijken
str(count_matrix)
#visualiseren de counts
counts <- count_matrix$counts
head(counts)
#naam kolommen aanpassen
colnames(counts) <- c("ctrl_01", "ctrl_02", "ctrl_03", "ctrl_04", "ra_01", "ra_02", "ra_03", "ra_04")
head(counts)

#matrix opslaan als cvs
write.csv(counts, "reuma_countmatrix.csv")
#inlezen countmatrix
# Working directory instellen

setwd("c:/Users/mindert/OneDrive - NHL Stenden/J2/Periode 4/Transciptnomics/Transcriptnomics real/Data_RA_raw//")

# Count matrix inladen
count_matrix_RA <- read.table("count_matrix_RA.txt", row.names = 1)
head(counts)
#packages
BiocManager::install("DESeq2")
BiocManager::install("KEGGREST")
BiocManager::install("EnhancedVolcano")
BiocManager::install("pathview")

library(DESeq2)
library(KEGGREST)
library(EnhancedVolcano)
library(pathview)
#rownames
patiënt_group <- c("control", "control", "control", "control", "reuma", "reuma", "reuma", "reuma")
patiënt_group_table <- data.frame(patiënt_group)

rownames(patiënt_group_table) <- c("control_1", "control_2", "control_3", "control_4", "reuma_1", "reuma_2", "reuma_3", "reauma_4")
head(patiënt_group_table)
head(count_matrix_RA)
#table namen aanpassen, naar juiste overeenkomst
colnames(count_matrix_RA) <- rownames(patiënt_group_table)
all(colnames(count_matrix_RA) == row.names(patiënt_group_table))
# Maak DESeqDataSet aan
dds <- DESeqDataSetFromMatrix(countData = count_matrix_RA,
                              colData = patiënt_group_table,
                              design = ~ patiënt_group)
#statistiek
# Voer analyse uit
dds <- DESeq(dds)
resultaten <- results(dds)
head(resultaten)
#betekenis: Rijnamen: Codes van de genen, afhankelijk van de gebruikte database.
#baseMean: Gemiddelde van het betreffende gen over alle samples.
#Log2FoldChange: Verdubbelingen/halveringen van de testgroep vergeleken met de controlegroep.
#lfcSE: Standaardfout van de Log2FoldChange.
#stat: De Wald-toets wordt uitgevoerd. Hierbij wordt de log2FoldChange gedeeld door de standaardfout hiervan. Om een p-waarde te genereren wordt deze waarde vergeleken met de standaardnormale verdeling.
#pvalue: p-waarde (bepaald zoals hierboven beschreven).
#padj: Gecorrigeerde p-waarde (standaard volgens Benjamini-Hochberg, aanpasbaar).
#resultaten opslaan
write.table(resultaten, file = 'ResultatenWC3_count_matrix_RA.csv', row.names = TRUE, col.names = TRUE)
head(write.table)
#fold change
sum(resultaten$padj < 0.05 & resultaten$log2FoldChange > 1, na.rm = TRUE)
sum(resultaten$padj < 0.05 & resultaten$log2FoldChange < -1, na.rm = TRUE)
hoogste_fold_change <- resultaten[order(resultaten$log2FoldChange, decreasing = TRUE), ]
laagste_fold_change <- resultaten[order(resultaten$log2FoldChange, decreasing = FALSE), ]
laagste_p_waarde <- resultaten[order(resultaten$padj, decreasing = FALSE), ]
#volcano plot
EnhancedVolcano(resultaten,
                lab = rownames(resultaten),
                x = 'log2FoldChange',
                y = 'padj')


#GO-analyse
#packages voor GO-analyse installeren
BiocManager::install("clusterProfiler")
BiocManager::install("org.Hs.eg.db")

#inladen van packages 
library(clusterProfiler)
library(org.Hs.eg.db)

#Maak een lijst van significante genen
sig_genen <- subset(resultaten,
                    padj < 0.05 &
                      abs(log2FoldChange) > 1)

head(sig_genen)
nrow(sig_genen)

#
head(rownames(sig_genen))

#Gene symbols ophalen
genes <- rownames(sig_genen)
head(genes)

#Omzetten naar Entrez IDs
gene.df <- bitr(
  genes,
  fromType = "SYMBOL",
  toType = "ENTREZID",
  OrgDb = org.Hs.eg.db)

head(gene.df)

#
nrow(gene.df)

#GO biological Process analyse
ego_bp <- enrichGO(
  gene = gene.df$ENTREZID,
  OrgDb = org.Hs.eg.db,
  keyType = "ENTREZID",
  ont = "BP",
  pAdjustMethod = "BH",
  pvalueCutoff = 0.05,
  qvalueCutoff = 0.05)

#Resultaten bekijken
head(as.data.frame(ego_bp))

#Resultaten bekijken
View(as.data.frame(ego_bp))

#Top 20 GO-termen
go_results <- as.data.frame(ego_bp)

head(go_results[,c("Description","p.adjust")],20)

#Dotplot maken
dotplot(ego_bp, showCategory = 15, font.size = 8)

#Opslaan van de dotplot
png("GO_dotplot_RA.png",
    width = 2000,
    height = 1500,
    res = 300)

dotplot(ego_bp, showCategory = 15)

dev.off()

#
go_results <- as.data.frame(ego_bp)

head(go_results,20)

# KEGG analyse

#Selecteer significante genen
sig_genen <- subset(resultaten,
                    padj < 0.05 &
                      abs(log2FoldChange) > 1)

head(sig_genen)
nrow(sig_genen)

#
library(org.Hs.eg.db)

entrez_ids <- mapIds(
  org.Hs.eg.db,
  keys = rownames(sig_genen),
  column = "ENTREZID",
  keytype = "SYMBOL",
  multiVals = "first")

entrez_ids <- na.omit(entrez_ids)

head(entrez_ids)
#
library(clusterProfiler)

kegg_result <- enrichKEGG(
  gene = entrez_ids,
  organism = "hsa",
  pvalueCutoff = 0.05)
#Kegg
library(clusterProfiler)

kegg_result <- enrichKEGG(
  gene = entrez_ids,
  organism = "hsa",
  pvalueCutoff = 0.05)


head(as.data.frame(kegg_result))
#
dotplot(kegg_result, showCategory = 10)
barplot(kegg_result, showCategory = 10)

#Pathway view analyse

## 1. Selecteer significante genen
sig_genen <- subset(resultaten,
                    padj < 0.05 &
                      abs(log2FoldChange) > 1)

## 2. Laad packages
library(org.Hs.eg.db)
library(clusterProfiler)
library(pathview)

## 3. SYMBOL → ENTREZID mapping
entrez_ids <- mapIds(org.Hs.eg.db,
                     keys = rownames(sig_genen),
                     column = "ENTREZID",
                     keytype = "SYMBOL",
                     multiVals = "first")

entrez_ids <- na.omit(entrez_ids)

## 4. Maak named vector met log2FC
gene_data <- sig_genen$log2FoldChange
names(gene_data) <- entrez_ids

## (belangrijk: remove NA match mismatch)
gene_data <- gene_data[!is.na(names(gene_data))]

## 5. KEGG enrichment (als je dit nog niet hebt)
kegg_result <- enrichKEGG(
  gene = entrez_ids,
  organism = "hsa",
  pvalueCutoff = 0.05)

## 6. Kies top pathway
kegg_df <- as.data.frame(kegg_result)
top_pathway <- kegg_df$ID[1]

## 7. Pathview plot maken
pv_out <- pathview(
  gene.data = gene_data,
  pathway.id = top_pathway,
  species = "hsa")

#inzoomen pathway
View(kegg_df)
#tabel opslaan
kegg_tabel <- kegg_df[, c(
  "ID",
  "Description",
  "GeneRatio",
  "Count",
  "p.adjust")]

write.csv(kegg_df,
          "kegg_df.csv",
          row.names = TRUE)
#
grep("Rheumatoid", kegg_df$Description, value = TRUE)
#
grep("TNF", kegg_df$Description, value = TRUE)
#
grep("IL-17", kegg_df$Description, value = TRUE)
#
pathview(
  gene.data = gene_data,
  pathway.id = "hsa05323",
  species = "hsa")
