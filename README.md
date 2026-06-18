<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/64d1b37a-8278-4e10-811f-a08d57792858" />


# **🌟Analyse van genexpressie bij patiënten met reuma in tegenstelling tot gezonde mensen🌟**
---



## 🌸Inhoud
---
♥  `Data/`

♥  `Scripts/`

♥  `Resultaten/`

♥  `Referenties/`


## 🩺Inleiding

Reumatoïde artritis (RA) is een chronische auto-immuunziekte die voornamelijk ontstekingen in de gewrichtslijmvlies veroorzaakt, wat leidt tot pijn en zwellingen. In westerse landen heeft ongeveer 0,5–1,0% van de bevolking RA. Vrouwen hebben hierbij een 2 tot 3 keer grotere kans om RA te ontwikkelen dan mannen. Het levenslange risico op het ontwikkelen van RA bedraagt ongeveer 3,6% voor vrouwen en 1,7% voor mannen. Genetica speelt een grote rol bij het ontstaan van RA: de erfelijkheid van de ziekte wordt geschat op 60%. Ook omgevingsfactoren spelen een rol. Zo hebben mensen die roken een grotere kans om RA te ontwikkelen (Jang et al., 2022). Hoe RA precies ontstaat, is echter nog niet volledig duidelijk en echter is er ook geen remedie. Wanneer naar de genetische kant van RA wordt gekeken, blijken verschillende genen bij te dragen aan een verhoogde gevoeligheid voor de ziekte. De belangrijkste genetische risicofactor bevindt zich in het Human Leukocyte Antigen (HLA)-gebied op chromosoom 6, met name het HLA-DRB1-gen, dat betrokken is bij de presentatie van antigenen aan T-cellen. Daarnaast zijn ook genen zoals PTPN22, STAT4 en PADI4 in verband gebracht met een verhoogd risico op RA. Door middel van genoombrede associatiestudies zijn inmiddels meer dan 100 genetische loci geïdentificeerd die geassocieerd zijn met de ziekte. Dit benadrukt dat RA een complexe genetische achtergrond heeft waarbij meerdere genen bijdragen aan het ontstaan van de ziekte (Kurko et al., 2013). Het doel van dit onderzoek is om genen en pathways te identificeren met het gebruik van transcriptomics analyse, waarbij er R gebruikt wordt om zo met verschillende analyses de betrokken genen en pathways te visualiseren. De gestelde onderzoeksvraag is, welke genen en pathways kunnen bijdragen aan de ontwikkeling van RA?



## 🔬Materiaal en Methode

Bij dit onderzoek, participeerde acht vrouwen. Vier van deze vrouwen, waren voor > 12 maanden gediagnoseerd met Reumatoïde artritis (RA) ACPA-positief. De overige vier vrouwen hadden geen reuma, en zijn ACPA-negatief. Vanuit deze vrouwen is er een bioposie genomen van het synovium oftewel slijmvlies. Deze biopten zijn RNA-geseucenced, de ruwe data afkomstig vanuit dit onderzoekt komt vanuit (Platzer et al., 2019). De analyse van de samples is uitgevoerd in R. Eerst is het humane referentiegenoom GRCh38.p14 (GCF_000001405.40) geïndexeerd met behulp van het R-package Rsubread (v2.24.0). Vervolgens zijn paired-end reads uitgelijnd tegen dit referentiegenoom, waarna BAM-bestanden zijn gegenereerd voor alle samples. Vervolgens is op basis van de alignments met de featureCounts een gen-level countmatrix opgesteld, met behulp van een GTF-annotatiebestand. Deze matrix vormde de input voor downstream analyse in DESeq2 (v1.50.2). Na normalisatie is een differentiële expressieanalyse uitgevoerd om genen te identificeren met significante expressieveranderingen tussen RA- en controlegroepen (padj < 0.05, |log2FC| > 1). Om uiteindelijk de resultaten van het onderzoek te visualiseren is er als eerste een volcanoplot gemaakt, met EnhancedVolcano (v1.28.2). Vervolgens werden de significante genen omgezet naar Entrez-ID's en gebruikt voor functionele verrijkingsanalyses met clusterProfiler (v4.18.4). Voor de Gene Ontology (GO)-analyse werden verrijkte biologische processen, cellulaire componenten en moleculaire functies bepaald. Daarnaast werd een KEGG pathway-analyse met pathwayview uitgevoerd om verrijkte pathways te identificeren. Tenslotte werden de gevonden pathways gevisualiseerd met pathview (v1.50.0), waarbij de expressiewaarden van de significante genen werden weergegeven binnen de geselecteerde KEGG-routes.

<p align="center">
  <img src="https://github.com/user-attachments/assets/dec5b56d-6291-404a-9c13-f90e56441b9a" width="800" height="600">
</p>



## 💻Resultaten
<img width="1917" height="982" alt="Rplot_Volcano_plot_Zoom" src="https://github.com/user-attachments/assets/6efe6407-06b3-462e-a518-2161b8b2b6b6" />

<sub><b>Figuur 1.</b> <i>***Volcano plot van differentiële genexpressie in slijmvliesbiopten van ACPA-positieve reumatoïde artritis (RA) patiënten ten opzichte van ACPA-negatieve controles. De x-as geeft de log2 fold change weer, waarbij positieve waarden een verhoogde genexpressie en negatieve waarden een verlaagde genexpressie aangeven. De y-as toont de statistische significantie als -log10(p-waarde). Punten boven de ingestelde significantiedrempel vertegenwoordigen differentieel tot expressie komende genen. Elke stip representeert één gen.(n = 8)***.</i></sub>



## 🩹Conclusie

blabla
## 🌼AI gebruik en competenties

blabvla
