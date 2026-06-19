<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/64d1b37a-8278-4e10-811f-a08d57792858" />

<sub><b>Figuur 1.</b> <i>***Voorblad gemaakt met AI***.</i></sub>


# **🌟Analyse van genexpressie bij patiënten met reuma in tegenstelling tot gezonde mensen🌟**
---



## 🌸Inhoud
---
♥  `Assets/` Overige documenten

♥  `Bronnen/` Literatuur en referenties voor binnen dit project

♥  `Raw_Data/` Verkregen ruwe data gebruikt in het project

♥  `Resultaten/` Output uit analysem figuren, grafieken en tabellen

♥  `Scripts_R/` R-script, van het verwerken van het data en het visualiseren

♥  `README.md/` overzicht en uitleg over het project, behoud, doel, inleiding, methode, resultaten, conclusie en AI gebruik


## 🩺Inleiding

Reumatoïde artritis (RA) is een chronische auto-immuunziekte die voornamelijk ontstekingen in de gewrichtslijmvlies veroorzaakt, wat leidt tot pijn en zwellingen. In westerse landen heeft ongeveer 0,5–1,0% van de bevolking RA. Vrouwen hebben hierbij een 2 tot 3 keer grotere kans om RA te ontwikkelen dan mannen. Het levenslange risico op het ontwikkelen van RA bedraagt ongeveer 3,6% voor vrouwen en 1,7% voor mannen. Genetica speelt een grote rol bij het ontstaan van RA: de erfelijkheid van de ziekte wordt geschat op 60%. Ook omgevingsfactoren spelen een rol. Zo hebben mensen die roken een grotere kans om RA te ontwikkelen (Jang et al., 2022). Hoe RA precies ontstaat, is echter nog niet volledig duidelijk en echter is er ook geen remedie, wederom is de aanwezigheid van ACPA-antilichamen een belkangrijke marker voor een vroege diagnose van RA (Kurowska et al., 2017). Wanneer naar de genetische kant van RA wordt gekeken, blijken verschillende genen bij te dragen aan een verhoogde gevoeligheid voor de ziekte. De belangrijkste genetische risicofactor bevindt zich in het Human Leukocyte Antigen (HLA)-gebied op chromosoom 6, met name het HLA-DRB1-gen, dat betrokken is bij de presentatie van antigenen aan T-cellen. Daarnaast zijn ook genen zoals PTPN22, STAT4 en PADI4 in verband gebracht met een verhoogd risico op RA. Door middel van genoombrede associatiestudies zijn inmiddels meer dan 100 genetische loci geïdentificeerd die geassocieerd zijn met de ziekte. Dit benadrukt dat RA een complexe genetische achtergrond heeft waarbij meerdere genen bijdragen aan het ontstaan van de ziekte (Kurko et al., 2013). Het doel van dit onderzoek is om genen en pathways te identificeren met het gebruik van transcriptomics analyse, waarbij er R gebruikt wordt om zo met verschillende analyses de betrokken genen en pathways te visualiseren. Hierbij is de gestelde onderzoeksvraag is, welke veranderingen in de expressie van genen en activatie van immuunpathways kunnen bijdragen aan de ontwikkeling en de gewrichtsvernieteging van ACPA-positieve patiënten in tegenstelling tot ACPA-negatieve controle's? 





## 🔬Materiaal en Methode

Bij dit onderzoek, participeerde acht vrouwen. Vier van deze vrouwen, waren voor > 12 maanden gediagnoseerd met Reumatoïde artritis (RA) ACPA-positief. De overige vier vrouwen hadden geen reuma, en zijn ACPA-negatief. Vanuit deze vrouwen is er een bioposie genomen van het synovium oftewel slijmvlies. Deze biopten zijn RNA-geseucenced, de ruwe data afkomstig vanuit dit onderzoekt komt vanuit (Platzer et al., 2019). De analyse van de samples is uitgevoerd in R. Eerst is het humane referentiegenoom GRCh38.p14 (GCF_000001405.40) geïndexeerd met behulp van het R-package Rsubread (v2.24.0). Vervolgens zijn paired-end reads uitgelijnd tegen dit referentiegenoom, waarna BAM-bestanden zijn gegenereerd voor alle samples. Vervolgens is op basis van de alignments met de featureCounts een gen-level countmatrix opgesteld, met behulp van een GTF-annotatiebestand. Deze matrix vormde de input voor downstream analyse in DESeq2 (v1.50.2). Na normalisatie is een differentiële expressieanalyse uitgevoerd om genen te identificeren met significante expressieveranderingen tussen RA- en controlegroepen (padj < 0.05, |log2FC| > 1). Om uiteindelijk de resultaten van het onderzoek te visualiseren is er als eerste een volcanoplot gemaakt, met EnhancedVolcano (v1.28.2). Vervolgens werden de significante genen omgezet naar Entrez-ID's en gebruikt voor functionele verrijkingsanalyses met clusterProfiler (v4.18.4). Voor de Gene Ontology (GO)-analyse werden verrijkte biologische processen, cellulaire componenten en moleculaire functies bepaald. Daarnaast werd een KEGG pathway-analyse met pathwayview uitgevoerd om verrijkte pathways te identificeren. Tenslotte werden de gevonden pathways gevisualiseerd met pathview (v1.50.0), waarbij de expressiewaarden van de significante genen werden weergegeven binnen de geselecteerde KEGG-routes.

<p align="center">
  <img src="https://github.com/user-attachments/assets/dec5b56d-6291-404a-9c13-f90e56441b9a" width="800" height="600">
</p>

<sub><b>Figuur 2.</b> <i>***Workflow gemaakt met ai***.</i></sub>

## 💻Resultaten

**🌸Volcano dotplot**

RNA-sequencing van 4 ACPA-positieve RA-patiënten en 4 ACPA-negatieve controles identificeerde meerdere differentieel geëxprimeerde genen. In de volcano plot [(Figuur 3)](Resultaten/Figuur%201_Rplot_Volcano_plot_Zoom.png)  vertegenwoordigen rode punten genen die zowel een significante p-waarde als een sterke verandering in expressie vertonen, terwijl groene punten alleen een significante fold change laten zien. De meest opvallende opgereguleerde genen waren *SRGN*, *PTGFR*, *ADAMTS6*, *CXCR1*, *IGHV4-4*, *IGHG4* en *IGKV1-39*. Sterk neer-gereguleerde genen waren onder andere *ANKRD30BL*, *MT-ND6*, *RAB3IL1*, *SLC9A3R2* en *ZNF598*. Deze resultaten wijzen mogelijk op een verhoogde immuunactiviteit in de ACPA-positieve groep ten opzichte van de controle groep.

<img width="1917" height="982" alt="Rplot_Volcano_plot_Zoom" src="https://github.com/user-attachments/assets/6efe6407-06b3-462e-a518-2161b8b2b6b6" />

<sub><b>Figuur 3.</b> <i>***Volcano plot van differentiële genexpressie in slijmvliesbiopten van ACPA-positieve reumatoïde artritis (RA) patiënten ten opzichte van ACPA-negatieve controles. De x-as geeft de log2 fold change weer, waarbij positieve waarden een verhoogde genexpressie en negatieve waarden een verlaagde genexpressie aangeven. De y-as toont de statistische significantie als -log10(p-waarde). Punten boven de ingestelde significantiedrempel vertegenwoordigen differentieel tot expressie komende genen. Elke stip representeert één gen.(n = 8)***.</i></sub>
___
**🌸Go-analyse**

In figuur 4 is zichtbaar in de GO-verrijkingsanalyse dat er een sterke toename te zien is van immuun- en lymfocytgerelateerde biologische processen, waaronder lymfocytdifferentiatie, leukocyt-gemedieerde immuniteit, B-celactivatie, T-celdifferentiatie en immunoglobuline-gemedieerde immuunrespons. De grootste stippen werden waargenomen bij lymfocytdifferentiatie en leukocyt-gemedieerde immuniteit, wat aangeeft dat deze processen het grootste aantal differentieel expressie van genen heeft. De laagste aangepaste p-waarden werden gevonden bij processen zoals immunoglobuline-gemedieerde immuunrespons en adaptieve immuunrespons gebaseerd op somatische recombinatie van immunoglobuline-superfamilie receptoren, weergegeven door de felrode kleur.

<img width="1917" height="987" alt="image" src="https://github.com/user-attachments/assets/36eb2518-4cac-4b15-bc51-38b1b987566e" /> 

<sub><b>Figuur 4.</b> <i>***Een GO-dotplot, van differentïele tot expressie komende genen uit de slijmvliesbiopten van ACPA-positieve RA patiënten in tegenstelling tot ACPA-negatieve controle. Hierbij weergeeft de x-as de GeneRatio, waarbij de genen worden gevisualiseerd bij welke biologische processen deze toebehoren. Waarbij de y-as de verschillende biologische processen weergeeft. De grootte van de cirkel toont aan de aantal genen in deze cirkel, en de kleur de significantie van de p-waarde.(n = 8)***.</i></sub>
___
**🌸KEGG-pathway analyse in dotplot en barplot**

De KEGG pathway analyse liet zien dat meerdere ontstekings- en immuungerelateerde pathways significant verrijkt waren in de dataset (Figuur 5A). De hoogste GeneRatio werd gevonden voor de MAPK signaling pathway (≈0,05), gevolgd door Epstein-Barr virus infection en de NOD-like receptor signaling pathway. Daarnaast werden ook de TNF signaling pathway, NF-kappa B signaling pathway, Th17 cell differentiation en de IL-17 signaling pathway verrijkt gevonden.
De grootste aantallen genen werden waargenomen voor de MAPK signaling pathway, terwijl pathways zoals Leishmaniasis en de IL-17 signaling pathway minder genen bevatten. Alle weergegeven pathways waren statistisch significant (adjusted p-value < 0,001), waarbij de sterkste significantie werd gevonden voor onder andere de TNF signaling pathway, NF-kappa B signaling pathway en Leishmaniasis.

De KEGG pathway verrijkingsanalyse identificeerde verschillende significant verrijkte pathways in de differentieel tot expressie komende genen tussen ACPA-positieve RA-patiënten en ACPA-negatieve controles (Figuur 5B). De hoogste aantallen genen werden gevonden in de *MAPK signaling pathway*, gevolgd door *Epstein-Barr virus infection* en de *NOD-like receptor signaling pathway*. Daarnaast waren ook de *TNF signaling pathway*, *Protein processing in endoplasmic reticulum* en *NF-kappa B signaling pathway* sterk vertegenwoordigd. De kleur van de balken weerspiegelt de aangepaste p-waarde, waarbij felrode balken wijzen op een hogere statistische significantie dan donkerrode of blauwe balken. De *NOD-like receptor signaling pathway*, *TNF signaling pathway* en *NF-kappa B signaling pathway* behoorden tot de meest significante pathways. Verder werden verrijkingen waargenomen in ontstekings- en immuungerelateerde pathways, waaronder de *IL-17 signaling pathway*, *Th17 cell differentiation* en de *AGE-RAGE signaling pathway in diabetic complications*.




<table align="center">
<tr>
<td align="center">
<img src="https://github.com/user-attachments/assets/9f92dec3-cbbd-4219-b8cf-fa0ace7000f8" width="420"><br>
<b>Figuur 5A.</b> KEGG pathway in een dotplot verrijkingsanalyse van de differentieel tot expressie gebrachte genen tussen ACPA+ patiënten met RA en ACPA- controles.
</td>


<td align="center">
<img src="https://github.com/user-attachments/assets/fcb35979-4d46-4895-9753-239251d322c5" width="420"><br>
<b>Figuur 5B.</b> KEGG pathway in een balkplot verrijkingsanalyse van de differentieel tot expressie gebrachte genen tussen ACPA+ patiënten met RA en ACPA- controles.
</td>
</tr>
</table>

<sub><b>Figuur 5A.</b> <i>***KEGG pathway in een dotplot verrijkingsanalyse van de differentieel tot expressie gebrachte genen tussen ACPA+ patiënten met RA en ACPA- controles. De x-as toont de aandeel van genen gekoppeld aan een pathway (GeneRatio), waarbij de y-as verschillende KEGG-pathways weergeeft. De grootte van de stip laat de aantal gekoppelde genen zien en de kleur de significantie van de p-waarde (n=8).***.</i></sub>

<sub><b>Figuur 5B.</b> <i>***KEGG pathway in een balkplot verrijkingsanalyse van de differentieel tot expressie gebrachte genen tussen ACPA+ patiënten met RA en ACPA- controles. De x-as toont de aandeel van genen gekoppeld aan een pathway (count), waarbij de y-as verschillende KEGG-pathways weergeeft. De balken staan gelijk aan een pathway en de lengte van de balk visualiseert hoeveel genen zijn betrokken aan die pathway, en de kleur de significantie van de p-waarde (n=8).***.</i></sub>


_____

**🌸KEGG pathway analyse in diagram**

De RNA-data van de vier vrouwen met reumatoïde artritis (RA) en de vier controlepersonen zijn geanalyseerd via twee KEGG-pathway diagrammen, waarbij Figuur 6A alle significant veranderde genen markeert en Figuur 6B de expressierichting toont (rood voor upregulatie; groen voor downregulatie). Binnen de pathway lichten genen op in vier hoofdroutes met specifieke patronen. Ten eerste is er bij de immuuncel-interactie een sterke upregulatie te zien van de costimulerende receptoren CD80/86, CD28 en CTLA4, evenals IL15 en LFA1, terwijl de receptor MHCII juist omlaag is gereguleerd. Ten tweede is binnen de ontstekingscascade het cytokine IL1 (en IL1$\beta$) sterk omhoog gereguleerd in macrofagen — in tegenstelling tot IL6 en TNF$\alpha$ die onveranderd bleven — samen met de chemokines CCL2 en CXCL1 die de celmigratie aansturen. Ten derde laat de angiogenese-route zien dat de receptor Tie2 is verhoogd, terwijl VEGF en CXCL5 een verlaagde expressie tonen. Ten slotte is er bij de weefselafbraak een duidelijke splitsing zichtbaar: het kraakbeenafbrekende enzym MMP1/3 is sterk omhoog gereguleerd, terwijl de specifieke botafbrekende factoren CTSL en V-ATPase in de osteoclasten juist omlaag zijn gereguleerd.

<table align="center">
<tr>
<td align="center">
<img src="https://github.com/user-attachments/assets/cec99511-afa9-4b85-84e8-dbe0967c9bca" width="420"><br>
<b>Figuur 6A.</b> KEGG pathway verrijkingsanalyse van de differentieel tot significant expressie gebrachte genen tussen ACPA+ patiënten met RA en ACPA- controles.
</td>


<td align="center">
<img src="https://github.com/user-attachments/assets/580a067d-bb02-42c7-8fa5-98bdd7da1f15" width="420"><br>
<b>Figuur 6B.</b> KEGG pathway in een verrijkingsanalyse van de differentieel tot significant expressie gebrachte genen tussen ACPA+ patiënten met RA en ACPA- controles. 
</td>
</tr>
</table>

<sub><b>Figuur 6.</b> <i>***KEGG-pathway analyse van de reumatoïde artritis route. (6a) Algemene verrijking van de route, waarbij alle significant veranderde genen en eiwitten uit de R-analyse groen zijn gemarkeerd tegen de standaard biologische achtergrond (wit/grijs).
(6b) Differentiële genexpressie binnen dezelfde route, waarbij de kleurenbalk (legenda van -1 tot +1) de exacte richting van de expressieverandering bij de RA-groep ten opzichte van de controles aangeeft. Rode vakjes duiden op een verhoogde expressie (upregulatie) en groene vakjes op een verlaagde expressie (downregulatie) (8=n).***.</i></sub>



---

## 🩹Conclusie

Op basis van de resultaten die gebaseerd zijn op de RNA-data uit het onderzoek, kan worden geconcludeerd dat de ontwikkeling van reumatoïde artritis (RA) bij deze patiënten wordt gedreven door een ontspoorde immuuntolerantie. Dit wordt gekenmerkt door de upregulatie van specifieke immunoglobuline-genen (IGHV4-4, IGHG4, IGKV1-39) en B-celprocessen, wat aansluit bij de ACPA-positieve status van de vrouwen met RA.De chronische gewrichtsschade die bij RA ontstaat, komt doordat deze geactiveerde immuuncellen via centrale signaalroutes (zoals MAPK, TNF en NF-$\kappa$B) communiceren met het lokale gewrichtsweefsel. Dit zet een cascade in werking van verhoogde celmigratie (CD80/86, CD28, CCL2, CXCL1) en ontstekingscytokines (IL1, IL1$\beta$). De gevolgen van deze cascade van verhoogde celmigratie en ontstekingscytokines zorgen direct voor actieve weefseldestructie, wat biologisch wordt bewezen door de sterke upregulatie van het kraakbeenafbrekende enzym MMP1/3. Wat ook opvallend is, is dat specifieke botafbraakfactoren (CTSL, V-ATPase) op dit meetpunt juist omlaag gereguleerd zijn.Als er tot slot gekeken wordt naar de onderzoeksvraag ("Welke veranderingen in de expressie van genen en activatie van immuunpathways kunnen bijdragen aan de ontwikkeling en de gewrichtsvernietiging van ACPA-positieve patiënten in tegenstelling tot ACPA-negatieve controles?"), kan er worden geconcludeerd dat er bij de patiënten met ACPA-positieve RA sprake is van een duidelijke upregulatie in de expressie van genen en immuunpathways die te maken hebben met een toename van weefseldestructie naarmate de RA zich verder ontwikkelt. 

Hierbij moet er nog wel worden gekeken naar enige beperkingen in het onderzoek.
Er waren 8 vrouwen die deelnamen aan het onderzoek, waarvan vier vrouwen ACPA+ met >12 maanden gediagnosteerd RA. En 4 ACPA - controle vrouwen, dit is een laag aantal deelnemers en zouden voor betrouwbaarheid van de resultaten wel voor verder onderzoek naar meer deelnemers mogen worden gekeken. Daarnaast zat er een grote gat tussen de leeftijden van de deelnemers, de controle groep hadden een leeftijd van tussen de 20-40 en de RA psotieve vrouwen hadden een leeftijd van 50-70. Hierbij is er met leeftijd ook mogelijk invloed om dat kraakbeen degradeert naarmate de toename van de leeftijd van de persoon (Kijowski et al., 2022).

---

## 🌼AI gebruik

**🖥️AI gebruik**
Bij het maken van deze github pagina is er gebruik gemaakt van AI, specifiek met chatGPT & Gemini. 
Voor de plaatjes op de voorblad en materiaal en methode, is er chatGPT gebruikt om deze te maken. figuur 1 & 2. 
Voor inhoud, tekstgewijs en opmaaksgewijs. Is Ai gebruikt, voor: spellingscontrole, aanknooppunt om tekst te schrijven, code voor het maken van het GITHUB pagina en hoe alles werkt en de opmaak (lettertype, plaatjes juiste plek of naast elkaar). 
Voor de verkregen resultaten, is AI gebruikt, ter ondersteuning van de analyse van de resultaten, volcano plot, GO-analyse, KEGG-pathways, Differentiele genexpressie pathways's. AI is gebruikt als extra uitleg, wat wat zou kunnen zeggen, hierbij is er zelf wel verder nog naar gekeken en onderzocht omdat AI niet volledig betrouwbaar is.

In R, is AI gebruikt voor:
- ondersteuning van de zelfgeschreven code in de script, omdat naturlijk niet altijd alles werkt en daarbij chatGPT mogelijke oplossingen brengt.
- Het sorteren van het script, betere overzicht van alle getypte code.


---
## ⚖️Bronnen

Platzer A, Nussbaumer T, Karonitsch T, Smolen JS, Aletaha D. Analysis of gene expression in rheumatoid arthritis and related conditions offers insights into sex-bias, gene biotypes and co-expression patterns. PLoS One. 2019 Jul 25;14(7):e0219698. doi: 10.1371/journal.pone.0219698. PMID: 31344123; PMCID: PMC6657850. 

Yap HY, Tee SZ, Wong MM, Chow SK, Peh SC, Teow SY. Pathogenic Role of Immune Cells in Rheumatoid Arthritis: Implications in Clinical Treatment and Biomarker Development. Cells. 2018 Oct 9;7(10):161. doi: 10.3390/cells7100161. PMID: 30304822; PMCID: PMC6211121.

Kurkó J, Besenyei T, Laki J, Glant TT, Mikecz K, Szekanecz Z. Genetics of rheumatoid arthritis - a comprehensive review. Clin Rev Allergy Immunol. 2013 Oct;45(2):170-9. doi: 10.1007/s12016-012-8346-7. PMID: 23288628; PMCID: PMC3655138. 

Kurowska, W., Kuca-Warnawin, E. H., Radzikowska, A., & Maśliński, W. (2017). The role of anti-citrullinated protein antibodies (ACPA) in the pathogenesis of rheumatoid arthritis. Central European Journal of Immunology, 42(4), 390–398. https://doi.org/10.5114/ceji.2017.72807  

Kijowski R, Sharafi A, Zibetti MVW, Chang G, Cloos MA, Regatte RR. Age-Dependent Changes in Knee Cartilage T1 , T2 , and T1p Simultaneously Measured Using MRI Fingerprinting. J Magn Reson Imaging. 2023 Jun;57(6):1805-1812. doi: 10.1002/jmri.28451. Epub 2022 Oct 3. PMID: 36190187; PMCID: PMC10067532.





  
