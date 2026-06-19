<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/64d1b37a-8278-4e10-811f-a08d57792858" />


# **🌟Analyse van genexpressie bij patiënten met reuma in tegenstelling tot gezonde mensen🌟**
---



## 🌸Inhoud
---
♥  `Assets/`

♥  `Bronnen/`

♥  `Raw_Data/`

♥  `Resultaten/`

♥  `Scripts_R/`


## 🩺Inleiding

Reumatoïde artritis (RA) is een chronische auto-immuunziekte die voornamelijk ontstekingen in de gewrichtslijmvlies veroorzaakt, wat leidt tot pijn en zwellingen. In westerse landen heeft ongeveer 0,5–1,0% van de bevolking RA. Vrouwen hebben hierbij een 2 tot 3 keer grotere kans om RA te ontwikkelen dan mannen. Het levenslange risico op het ontwikkelen van RA bedraagt ongeveer 3,6% voor vrouwen en 1,7% voor mannen. Genetica speelt een grote rol bij het ontstaan van RA: de erfelijkheid van de ziekte wordt geschat op 60%. Ook omgevingsfactoren spelen een rol. Zo hebben mensen die roken een grotere kans om RA te ontwikkelen (Jang et al., 2022). Hoe RA precies ontstaat, is echter nog niet volledig duidelijk en echter is er ook geen remedie. Wanneer naar de genetische kant van RA wordt gekeken, blijken verschillende genen bij te dragen aan een verhoogde gevoeligheid voor de ziekte. De belangrijkste genetische risicofactor bevindt zich in het Human Leukocyte Antigen (HLA)-gebied op chromosoom 6, met name het HLA-DRB1-gen, dat betrokken is bij de presentatie van antigenen aan T-cellen. Daarnaast zijn ook genen zoals PTPN22, STAT4 en PADI4 in verband gebracht met een verhoogd risico op RA. Door middel van genoombrede associatiestudies zijn inmiddels meer dan 100 genetische loci geïdentificeerd die geassocieerd zijn met de ziekte. Dit benadrukt dat RA een complexe genetische achtergrond heeft waarbij meerdere genen bijdragen aan het ontstaan van de ziekte (Kurko et al., 2013). Het doel van dit onderzoek is om genen en pathways te identificeren met het gebruik van transcriptomics analyse, waarbij er R gebruikt wordt om zo met verschillende analyses de betrokken genen en pathways te visualiseren. De gestelde onderzoeksvraag is, welke genen en pathways kunnen bijdragen aan de ontwikkeling van RA?



## 🔬Materiaal en Methode

Bij dit onderzoek, participeerde acht vrouwen. Vier van deze vrouwen, waren voor > 12 maanden gediagnoseerd met Reumatoïde artritis (RA) ACPA-positief. De overige vier vrouwen hadden geen reuma, en zijn ACPA-negatief. Vanuit deze vrouwen is er een bioposie genomen van het synovium oftewel slijmvlies. Deze biopten zijn RNA-geseucenced, de ruwe data afkomstig vanuit dit onderzoekt komt vanuit (Platzer et al., 2019). De analyse van de samples is uitgevoerd in R. Eerst is het humane referentiegenoom GRCh38.p14 (GCF_000001405.40) geïndexeerd met behulp van het R-package Rsubread (v2.24.0). Vervolgens zijn paired-end reads uitgelijnd tegen dit referentiegenoom, waarna BAM-bestanden zijn gegenereerd voor alle samples. Vervolgens is op basis van de alignments met de featureCounts een gen-level countmatrix opgesteld, met behulp van een GTF-annotatiebestand. Deze matrix vormde de input voor downstream analyse in DESeq2 (v1.50.2). Na normalisatie is een differentiële expressieanalyse uitgevoerd om genen te identificeren met significante expressieveranderingen tussen RA- en controlegroepen (padj < 0.05, |log2FC| > 1). Om uiteindelijk de resultaten van het onderzoek te visualiseren is er als eerste een volcanoplot gemaakt, met EnhancedVolcano (v1.28.2). Vervolgens werden de significante genen omgezet naar Entrez-ID's en gebruikt voor functionele verrijkingsanalyses met clusterProfiler (v4.18.4). Voor de Gene Ontology (GO)-analyse werden verrijkte biologische processen, cellulaire componenten en moleculaire functies bepaald. Daarnaast werd een KEGG pathway-analyse met pathwayview uitgevoerd om verrijkte pathways te identificeren. Tenslotte werden de gevonden pathways gevisualiseerd met pathview (v1.50.0), waarbij de expressiewaarden van de significante genen werden weergegeven binnen de geselecteerde KEGG-routes.

<p align="center">
  <img src="https://github.com/user-attachments/assets/dec5b56d-6291-404a-9c13-f90e56441b9a" width="800" height="600">
</p>



## 💻Resultaten

**🌸Volcano dotplot**

RNA-sequencing van 4 ACPA-positieve RA-patiënten en 4 ACPA-negatieve controles identificeerde meerdere differentieel geëxprimeerde genen. In de volcano plot vertegenwoordigen rode punten genen die zowel een significante p-waarde als een sterke verandering in expressie vertonen, terwijl groene punten alleen een significante fold change laten zien. De meest opvallende opgereguleerde genen waren *SRGN*, *PTGFR*, *ADAMTS6*, *CXCR1*, *IGHV4-4*, *IGHG4* en *IGKV1-39*. Sterk neer-gereguleerde genen waren onder andere *ANKRD30BL*, *MT-ND6*, *RAB3IL1*, *SLC9A3R2* en *ZNF598*. Deze resultaten wijzen mogelijk op een verhoogde immuunactiviteit in de ACPA-positieve groep ten opzichte van de controle groep.

<img width="1917" height="982" alt="Rplot_Volcano_plot_Zoom" src="https://github.com/user-attachments/assets/6efe6407-06b3-462e-a518-2161b8b2b6b6" />

<sub><b>Figuur 1.</b> <i>***Volcano plot van differentiële genexpressie in slijmvliesbiopten van ACPA-positieve reumatoïde artritis (RA) patiënten ten opzichte van ACPA-negatieve controles. De x-as geeft de log2 fold change weer, waarbij positieve waarden een verhoogde genexpressie en negatieve waarden een verlaagde genexpressie aangeven. De y-as toont de statistische significantie als -log10(p-waarde). Punten boven de ingestelde significantiedrempel vertegenwoordigen differentieel tot expressie komende genen. Elke stip representeert één gen.(n = 8)***.</i></sub>
___
**🌸Go-analyse**

In figuur 3 is zichtbaar in de GO-verrijkingsanalyse dat er een sterke toename te zien is van immuun- en lymfocytgerelateerde biologische processen, waaronder lymfocytdifferentiatie, leukocyt-gemedieerde immuniteit, B-celactivatie, T-celdifferentiatie en immunoglobuline-gemedieerde immuunrespons. De grootste stippen werden waargenomen bij lymfocytdifferentiatie en leukocyt-gemedieerde immuniteit, wat aangeeft dat deze processen het grootste aantal differentieel expressie van genen heeft. De laagste aangepaste p-waarden werden gevonden bij processen zoals immunoglobuline-gemedieerde immuunrespons en adaptieve immuunrespons gebaseerd op somatische recombinatie van immunoglobuline-superfamilie receptoren, weergegeven door de felrode kleur.

<img width="1917" height="987" alt="image" src="https://github.com/user-attachments/assets/36eb2518-4cac-4b15-bc51-38b1b987566e" /> 

<sub><b>Figuur 2.</b> <i>***Een GO-dotplot, van differentïele tot expressie komende genen uit de slijmvliesbiopten van ACPA-positieve RA patiënten in tegenstelling tot ACPA-negatieve controle. Hierbij weergeeft de x-as de GeneRatio, waarbij de genen worden gevisualiseerd bij welke biologische processen deze toebehoren. Waarbij de y-as de verschillende biologische processen weergeeft. De grootte van de cirkel toont aan de aantal genen in deze cirkel, en de kleur de significantie van de p-waarde.(n = 8)***.</i></sub>
___
**🌸KEGG-pathway analyse in dotplot en barplot**

De KEGG pathway analyse liet zien dat meerdere ontstekings- en immuungerelateerde pathways significant verrijkt waren in de dataset (Figuur 3A). De hoogste GeneRatio werd gevonden voor de MAPK signaling pathway (≈0,05), gevolgd door Epstein-Barr virus infection en de NOD-like receptor signaling pathway. Daarnaast werden ook de TNF signaling pathway, NF-kappa B signaling pathway, Th17 cell differentiation en de IL-17 signaling pathway verrijkt gevonden.
De grootste aantallen genen werden waargenomen voor de MAPK signaling pathway, terwijl pathways zoals Leishmaniasis en de IL-17 signaling pathway minder genen bevatten. Alle weergegeven pathways waren statistisch significant (adjusted p-value < 0,001), waarbij de sterkste significantie werd gevonden voor onder andere de TNF signaling pathway, NF-kappa B signaling pathway en Leishmaniasis.

De KEGG pathway verrijkingsanalyse identificeerde verschillende significant verrijkte pathways in de differentieel tot expressie komende genen tussen ACPA-positieve RA-patiënten en ACPA-negatieve controles (Figuur 3B). De hoogste aantallen genen werden gevonden in de *MAPK signaling pathway*, gevolgd door *Epstein-Barr virus infection* en de *NOD-like receptor signaling pathway*. Daarnaast waren ook de *TNF signaling pathway*, *Protein processing in endoplasmic reticulum* en *NF-kappa B signaling pathway* sterk vertegenwoordigd. De kleur van de balken weerspiegelt de aangepaste p-waarde, waarbij felrode balken wijzen op een hogere statistische significantie dan donkerrode of blauwe balken. De *NOD-like receptor signaling pathway*, *TNF signaling pathway* en *NF-kappa B signaling pathway* behoorden tot de meest significante pathways. Verder werden verrijkingen waargenomen in ontstekings- en immuungerelateerde pathways, waaronder de *IL-17 signaling pathway*, *Th17 cell differentiation* en de *AGE-RAGE signaling pathway in diabetic complications*.




<table align="center">
<tr>
<td align="center">
<img src="https://github.com/user-attachments/assets/9f92dec3-cbbd-4219-b8cf-fa0ace7000f8" width="420"><br>
<b>Figuur 3A.</b> KEGG pathway in een dotplot verrijkingsanalyse van de differentieel tot expressie gebrachte genen tussen ACPA+ patiënten met RA en ACPA- controles.
</td>


<td align="center">
<img src="https://github.com/user-attachments/assets/fcb35979-4d46-4895-9753-239251d322c5" width="420"><br>
<b>Figuur 3B.</b> KEGG pathway in een balkplot verrijkingsanalyse van de differentieel tot expressie gebrachte genen tussen ACPA+ patiënten met RA en ACPA- controles.
</td>
</tr>
</table>

<sub><b>Figuur 3A.</b> <i>***KEGG pathway in een dotplot verrijkingsanalyse van de differentieel tot expressie gebrachte genen tussen ACPA+ patiënten met RA en ACPA- controles. De x-as toont de aandeel van genen gekoppeld aan een pathway (GeneRatio), waarbij de y-as verschillende KEGG-pathways weergeeft. De grootte van de stip laat de aantal gekoppelde genen zien en de kleur de significantie van de p-waarde (n=8).***.</i></sub>

<sub><b>Figuur 3B.</b> <i>***KEGG pathway in een balkplot verrijkingsanalyse van de differentieel tot expressie gebrachte genen tussen ACPA+ patiënten met RA en ACPA- controles. De x-as toont de aandeel van genen gekoppeld aan een pathway (count), waarbij de y-as verschillende KEGG-pathways weergeeft. De balken staan gelijk aan een pathway en de lengte van de balk visualiseert hoeveel genen zijn betrokken aan die pathway, en de kleur de significantie van de p-waarde (n=8).***.</i></sub>


_____

**🌸KEGG pathway analyse in diagram**

De RNA-data van de vier vrouwen met reumatoïde artritis (RA) en de vier controlepersonen zijn geanalyseerd via twee KEGG-pathway diagrammen, waarbij Figuur 5 alle significant veranderde genen markeert en Figuur 6 de expressierichting toont (rood voor upregulatie; groen voor downregulatie). Binnen de pathway lichten genen op in vier hoofdroutes met specifieke patronen. Ten eerste is er bij de immuuncel-interactie een sterke upregulatie te zien van de costimulerende receptoren CD80/86, CD28 en CTLA4, evenals IL15 en LFA1, terwijl de receptor MHCII juist omlaag is gereguleerd. Ten tweede is binnen de ontstekingscascade het cytokine IL1 (en IL1$\beta$) sterk omhoog gereguleerd in macrofagen — in tegenstelling tot IL6 en TNF$\alpha$ die onveranderd bleven — samen met de chemokines CCL2 en CXCL1 die de celmigratie aansturen. Ten derde laat de angiogenese-route zien dat de receptor Tie2 is verhoogd, terwijl VEGF en CXCL5 een verlaagde expressie tonen. Ten slotte is er bij de weefselafbraak een duidelijke splitsing zichtbaar: het kraakbeenafbrekende enzym MMP1/3 is sterk omhoog gereguleerd, terwijl de specifieke botafbrekende factoren CTSL en V-ATPase in de osteoclasten juist omlaag zijn gereguleerd.

<table align="center">
<tr>
<td align="center">
<img src="https://github.com/user-attachments/assets/cec99511-afa9-4b85-84e8-dbe0967c9bca" width="420"><br>
<b>Figuur 5A.</b> KEGG pathway verrijkingsanalyse van de differentieel tot significant expressie gebrachte genen tussen ACPA+ patiënten met RA en ACPA- controles.
</td>


<td align="center">
<img src="https://github.com/user-attachments/assets/580a067d-bb02-42c7-8fa5-98bdd7da1f15" width="420"><br>
<b>Figuur 5B.</b> KEGG pathway in een verrijkingsanalyse van de differentieel tot significant expressie gebrachte genen tussen ACPA+ patiënten met RA en ACPA- controles. 
</td>
</tr>
</table>

<sub><b>Figuur 5.</b> <i>***KEGG-pathway analyse van de reumatoïde artritis route. (5a) Algemene verrijking van de route, waarbij alle significant veranderde genen en eiwitten uit de R-analyse groen zijn gemarkeerd tegen de standaard biologische achtergrond (wit/grijs).
(5b) Differentiële genexpressie binnen dezelfde route, waarbij de kleurenbalk (legenda van -1 tot +1) de exacte richting van de expressieverandering bij de RA-groep ten opzichte van de controles aangeeft. Rode vakjes duiden op een verhoogde expressie (upregulatie) en groene vakjes op een verlaagde expressie (downregulatie) (8=n).***.</i></sub>





## 🩹Conclusie

Op basis van de resultaten die uiteindelijk zijn gebaseerd op de RNA-data verworven uit het onderzoek, kan worden geconcludeerd dat de ontwikkeling van reumatoïde artritis (RA) bij deze patiënten wordt gedreven door een ontspoorde immuuntolerantie, dit wordt gekenmertk door de upregulatie van specifieke immunoglobuline-genen (IGHV4-4, IGHG4, IGKV1-39) en B-celprocessen. Wat aansluit bij de ACPA-positieve status van vrouwen met RA. 
De chronische gewrichtsschade die bij RA ontstaat komt doordat deze geactiveerde immuuncellen via centrale signaalroutes (zoals MAPK, TNF en NF-$\kappa$B) communiceren met het lokale gewrichtsweefsel. Dit zet een cascade in werking van verhoogde celmigratie (CD80/86, CD28, CCL2, CXCL1) en ontstekingscytokines (IL1, IL1$\beta$).


## 🌼AI gebruik

**🖥️AI gebruik**
Bij het maken van deze github pagina is er gebruik gemaakt van AI, specifiek met chatGPT.
Voor de plaatjes op de voorblad en materiaal en methode, is er chatGPT gebruikt om deze te maken.
Voor inhoud, tekstgewijs en opmaaksgewijs. Is chatGPT gebruikt, voor: spellingscontrole, aanknooppunt om tekst te schrijven, code voor het maken van het GITHUB pagina en hoe alles werkt en de opmaak (lettertype, plaatjes juiste plek of naast elkaar). 
Voor de verkregen resultaten, is chatGPT gebruikt, ter ondersteuning van de analyse van de resultaten, volcano plot, GO-analyse, KEGG-pathways, Differentiele genexpressie pathways's. AI is gebruikt als extra uitleg, wat wat zou kunnen zeggen, hierbij is er zelf wel verder nog naar gekeken en onderzocht omdat AI niet volledig betrouwbaar is.

In R, is AI gebruikt voor:
- ondersteuning van de zelfgeschreven code in de script, omdat naturlijk niet altijd alles werkt en daarbij chatGPT mogelijke oplossingen brengt.
- Het sorteren van het script, betere overzicht van alle getypte code.

  
