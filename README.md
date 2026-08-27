<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/64d1b37a-8278-4e10-811f-a08d57792858" />

<sub><b>Figuur 1.</b> <i>***Voorblad gemaakt met AI***.</i></sub>


# **🌟Differentiële genexpressie bij ACPA-positieve patiënten met reumatoïde artritis ten opzichte van ACPA-negatieve controles🌟**
---



## 🌸Inhoud
---
♥  `Assets/` Overige documenten

♥  `Bronnen/` Literatuur en referenties voor binnen dit project

♥  `Compententies/` Het beheren van data en het gebruiken van Github

♥  `Bewerkt_data/` Het ruwe data dat is bewerkt in R

♥  `Raw_Data/` Verkregen ruwe data gebruikt in het project

♥  `Resultaten/` Output uit analysem figuren, grafieken en tabellen

♥  `Scripts_R/` R-script, van het verwerken van het data en het visualiseren

♥  `README.md/` overzicht en uitleg over het project, behoud, doel, inleiding, methode, resultaten, conclusie en AI gebruik


## 🩺Inleiding

Reumatoïde artritis (RA) is een chronische auto-immuunziekte die voornamelijk ontsteking van het gewrichtsslijmvlies veroorzaakt, wat kan leiden tot pijn, zwelling en gewrichtsschade. In westerse landen heeft ongeveer 0,5–1,0% van de bevolking RA. Vrouwen hebben hierbij een twee- tot driemaal grotere kans om RA te ontwikkelen dan mannen. Het levenslange risico op het ontwikkelen van RA bedraagt ongeveer 3,6% voor vrouwen en 1,7% voor mannen. Zowel genetische als omgevingsfactoren spelen een belangrijke rol bij het ontstaan van RA. De erfelijkheid van RA wordt geschat op ongeveer 60%. Daarnaast hebben onder andere mensen die roken een verhoogd risico op het ontwikkelen van de ziekte (Jang et al., 2022). 
Hoe RA precies ontstaat, is nog niet volledig bekend en er bestaat momenteel geen genezende behandeling. ACPA-antilichamen (anti-citrullinated protein antibodies) vormen een belangrijke biomarker voor de vroege diagnose van RA en worden in verband gebracht met een specifieke vorm van de ziekte (Kurowska et al., 2017). Wanneer wordt gekeken naar de genetische achtergrond van RA, blijken verschillende genen bij te dragen aan de gevoeligheid voor de ziekte. De belangrijkste genetische risicofactor bevindt zich in het Human Leukocyte Antigen (HLA)-gebied op chromosoom 6, met name het HLA-DRB1-gen, dat betrokken is bij de presentatie van antigenen aan T-cellen. Daarnaast zijn genen zoals PTPN22, STAT4 en PADI4 in verband gebracht met een verhoogd risico op RA. Door middel van genoombrede associatiestudies zijn inmiddels meer dan 100 genetische loci geïdentificeerd die geassocieerd zijn met RA. Dit benadrukt de complexe genetische achtergrond van de ziekte, waarbij meerdere genen bijdragen aan de gevoeligheid voor RA (Kurko et al., 2013).
Naast genetische variatie kunnen veranderingen in genexpressie inzicht geven in de biologische processen die betrokken zijn bij RA. Transcriptomics maakt het mogelijk om de expressie van duizenden genen gelijktijdig te onderzoeken. Hierdoor kunnen genen worden geïdentificeerd die verschillend tot expressie komen tussen ACPA-positieve RA-patiënten en ACPA-negatieve controles. Vervolgens kunnen deze genen worden gekoppeld aan biologische processen en pathways om inzicht te krijgen in de moleculaire mechanismen die mogelijk betrokken zijn bij RA.
Het doel van dit onderzoek is om met behulp van transcriptomics differentieel geëxprimeerde genen en betrokken biologische pathways bij ACPA-positieve RA-patiënten ten opzichte van ACPA-negatieve controles te identificeren en te visualiseren met behulp van R. De onderzoeksvraag luidt: Welke veranderingen in genexpressie en welke immuungerelateerde pathways zijn geassocieerd met ACPA-positieve reumatoïde artritis ten opzichte van ACPA-negatieve controles?





## 🔬Materiaal en Methode

Bij dit onderzoek, participeerde acht vrouwen. Vier van deze vrouwen, waren voor > 12 maanden gediagnoseerd met Reumatoïde artritis (RA) ACPA-positief. De overige vier vrouwen hadden geen reuma, en zijn ACPA-negatief. Vanuit deze vrouwen is er een bioposie genomen van het synovium oftewel slijmvlies. Deze biopten zijn RNA-geseucenced, de ruwe data afkomstig vanuit dit onderzoekt komt vanuit (Platzer et al., 2019). De analyse van de samples is uitgevoerd in R. Eerst is het humane referentiegenoom GRCh38.p14 (GCF_000001405.40) geïndexeerd met behulp van het R-package Rsubread (v2.24.0). Vervolgens zijn paired-end reads uitgelijnd tegen dit referentiegenoom, waarna BAM-bestanden zijn gegenereerd voor alle samples. Vervolgens is op basis van de alignments met de featureCounts een gen-level countmatrix opgesteld, met behulp van een GTF-annotatiebestand. Deze matrix vormde de input voor downstream analyse in DESeq2 (v1.50.2). Na normalisatie is een differentiële expressieanalyse uitgevoerd om genen te identificeren met significante expressieveranderingen tussen RA- en controlegroepen (padj < 0.05, |log2FC| > 1). Om uiteindelijk de resultaten van het onderzoek te visualiseren is er als eerste een volcanoplot gemaakt, met EnhancedVolcano (v1.28.2). Vervolgens werden de significante genen omgezet naar Entrez-ID's en gebruikt voor functionele verrijkingsanalyses met clusterProfiler (v4.18.4). Voor de Gene Ontology (GO)-analyse werden verrijkte biologische processen, cellulaire componenten en moleculaire functies bepaald. Daarnaast werd een KEGG pathway-analyse met pathwayview uitgevoerd om verrijkte pathways te identificeren. Tenslotte werden de gevonden pathways gevisualiseerd met pathview (v1.50.0), waarbij de expressiewaarden van de significante genen werden weergegeven binnen de geselecteerde KEGG-routes.

<p align="center">
  <img src="https://github.com/user-attachments/assets/dec5b56d-6291-404a-9c13-f90e56441b9a" width="800" height="600">
</p>

<sub><b>Figuur 2.</b> <i>***Workflow gemaakt met ai***.</i></sub>

## 💻Resultaten

**🌸Differentiële genexpressie laat sterke verschillen zien tussen ACPA-positieve RA-patiënten en controles**

Om verschillen in genexpressie tussen ACPA-positieve RA-patiënten en ACPA-negatieve controles te bepalen, werd RNA-sequencing geanalyseerd met DESeq2. In de volcano plot (Figuur 3) zijn de genen weergegeven op basis van hun log2 fold change en aangepaste p-waarde (padj). Genen met een aangepaste p-waarde < 0,05 en een absolute log2 fold change > 1 werden beschouwd als sterk differentieel geëxprimeerd. Dit betekent dat de genexpressie minimaal tweevoudig was veranderd ten opzichte van de controlegroep. Genen met een log2 fold change > 1 waren verhoogd geëxprimeerd, terwijl genen met een log2 fold change < −1 verlaagd geëxprimeerd waren.

De sterkst opgereguleerde genen waren onder andere SRGN, PTGFR, ADAMTS6, CXCR1, IGHV4-4, IGHG4 en IGKV1-39. Sterk neergereguleerde genen waren onder andere ANKRD30BL, MT-ND6, RAB3IL1, SLC9A3R2 en ZNF598. De resultaten laten zien dat meerdere genen duidelijk verschillen in expressie tussen ACPA-positieve RA-patiënten en ACPA-negatieve controles, waaronder verschillende genen die betrokken zijn bij immuun- en ontstekingsprocessen.

<img width="1917" height="982" alt="Rplot_Volcano_plot_Zoom" src="https://github.com/user-attachments/assets/6efe6407-06b3-462e-a518-2161b8b2b6b6" />

<sub><b>Figuur 3.</b> <i>***Volcano plot van differentiële genexpressie in synoviale biopsieën van ACPA-positieve reumatoïde artritis (RA)-patiënten ten opzichte van ACPA-negatieve controles. De x-as geeft de log2 fold change weer, waarbij positieve waarden een verhoogde en negatieve waarden een verlaagde genexpressie in de RA-groep aangeven. De y-as geeft de −log10 van de aangepaste p-waarde (padj) weer. Een gen werd als sterk differentieel geëxprimeerd beschouwd bij een padj < 0,05 en |log2 fold change| > 1, wat overeenkomt met minimaal een tweevoudige verandering in genexpressie. Elk punt vertegenwoordigt één gen (n = 8).***.</i></sub>
___
**🌸Differentieel geëxprimeerde genen zijn voornamelijk betrokken bij immuungerelateerde processen**

Om te bepalen welke biologische processen oververtegenwoordigd zijn onder de sterk differentieel geëxprimeerde genen, werd een Gene Ontology (GO) Biological Process-verrijkingsanalyse uitgevoerd met clusterProfiler. De analyse liet voornamelijk verrijking zien van immuun- en lymfocytgerelateerde biologische processen, waaronder lymfocytdifferentiatie, leukocyt-gemedieerde immuniteit, B-celactivatie, T-celdifferentiatie en immunoglobuline-gemedieerde immuunrespons (Figuur 4).

De GeneRatio geeft hierbij het aandeel van de ingevoerde differentieel geëxprimeerde genen weer dat aan een specifieke GO-term is gekoppeld. De grootte van de stip correspondeert met het aantal genen (Count) dat binnen de betreffende GO-term aanwezig is. De kleur van de stip geeft de aangepaste p-waarde weer, waarbij een lagere aangepaste p-waarde een sterkere statistische verrijking aangeeft. De grootste stippen werden onder andere gezien bij lymfocytdifferentiatie en leukocyt-gemedieerde immuniteit, wat aangeeft dat relatief veel van de geanalyseerde genen aan deze processen zijn gekoppeld. Processen met een lage aangepaste p-waarde, waaronder immunoglobuline-gemedieerde immuunrespons en adaptieve immuunrespons gebaseerd op somatische recombinatie van immunoglobuline-superfamilie-receptoren, vertoonden de sterkste statistische verrijking.

Gezamenlijk wijzen de GeneRatio, het aantal betrokken genen en de aangepaste p-waarden erop dat immuun- en lymfocytgerelateerde processen sterk vertegenwoordigd zijn binnen de geselecteerde differentieel geëxprimeerde genen.

<img width="1917" height="987" alt="image" src="https://github.com/user-attachments/assets/36eb2518-4cac-4b15-bc51-38b1b987566e" /> 

<sub><b>Figuur 4.</b> <i>***GO Biological Process-dotplot van de verrijkingsanalyse van sterk differentieel geëxprimeerde genen in synoviale biopsieën van ACPA-positieve RA-patiënten ten opzichte van ACPA-negatieve controles. De y-as toont de verrijkte GO Biological Process-termen en de x-as de GeneRatio, het aandeel van de ingevoerde genen dat aan de betreffende GO-term is gekoppeld. De grootte van iedere stip geeft het aantal gekoppelde genen (Count) weer en de kleur geeft de aangepaste p-waarde (p.adjust) weer; een lagere aangepaste p-waarde wordt weergegeven met een intensere kleur. Alleen de 15 meest weergegeven GO-termen zijn weergegeven.(n = 8)***.</i></sub>
___
**🌸Immuun- en ontstekingsgerelateerde KEGG-pathways zijn significant verrijkt**

Om te bepalen welke cellulaire signaalroutes oververtegenwoordigd waren onder de sterk differentieel geëxprimeerde genen, werd een KEGG pathway-verrijkingsanalyse uitgevoerd met clusterProfiler. Verschillende immuun- en ontstekingsgerelateerde pathways waren verrijkt in de ACPA-positieve RA-groep ten opzichte van de ACPA-negatieve controles (Figuur 5A en 5B). De MAPK signaling pathway had de hoogste GeneRatio en behoorde tevens tot de pathways met het grootste aantal betrokken genen. Ook Epstein-Barr virus infection en de NOD-like receptor signaling pathway vertoonden een relatief hoge GeneRatio. Daarnaast werden onder andere de TNF signaling pathway, NF-kappa B signaling pathway, Th17 cell differentiation en IL-17 signaling pathway verrijkt.

In de dotplot (Figuur 5A) geeft de GeneRatio het aandeel van de ingevoerde genen weer dat aan een pathway is gekoppeld, terwijl de grootte van de stip het absolute aantal betrokken genen (Count) weergeeft. De kleur representeert de aangepaste p-waarde, waarbij een lagere aangepaste p-waarde wijst op een sterkere statistische verrijking. De barplot (Figuur 5B) toont het aantal betrokken genen per pathway, waarbij de lengte van de balk overeenkomt met de Count en de kleur de aangepaste p-waarde weergeeft.

De verrijking van onder andere de TNF, NF-kappa B, NOD-like receptor, IL-17 en Th17 cell differentiation pathways laat zien dat meerdere van de differentieel geëxprimeerde genen betrokken zijn bij immuun- en ontstekingsgerelateerde signaalroutes.



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

<sub><b>Figuur 5A.</b> <i>***KEGG pathway-dotplot van de verrijkingsanalyse van sterk differentieel geëxprimeerde genen in synoviale biopsieën van ACPA-positieve RA-patiënten ten opzichte van ACPA-negatieve controles. De y-as toont de verrijkte KEGG-pathways en de x-as de GeneRatio, het aandeel van de ingevoerde genen dat aan de betreffende pathway is gekoppeld. De grootte van de stip geeft het aantal betrokken genen (Count) weer en de kleur geeft de aangepaste p-waarde (p.adjust) weer.***.</i></sub>

<sub><b>Figuur 5B.</b> <i>***KEGG pathway-barplot van de verrijkingsanalyse van sterk differentieel geëxprimeerde genen in synoviale biopsieën van ACPA-positieve RA-patiënten ten opzichte van ACPA-negatieve controles. De y-as toont de verrijkte KEGG-pathways en de x-as het aantal betrokken genen (Count). De lengte van iedere balk geeft het aantal genen weer dat aan de betreffende pathway is gekoppeld. De kleur geeft de aangepaste p-waarde (p.adjust) weer.***.</i></sub>


_____

**🌸Differentiële genexpressie binnen de RA-pathway toont veranderingen in ontsteking en weefselafbraak**

Om de differentiële genexpressie te lokaliseren binnen een biologisch relevante RA-signaalroute, werd de KEGG Rheumatoid Arthritis-pathway (hsa05323) gevisualiseerd met Pathview. Figuur 6A toont de volledige Rheumatoid Arthritis-pathway, inclusief de genen en eiwitten die volgens KEGG onderdeel zijn van deze route. Figuur 6B toont binnen dezelfde pathway de differentiële genexpressie tussen ACPA-positieve RA-patiënten en ACPA-negatieve controles, waarbij alleen genen die volgens de gebruikte selectiecriteria differentieel tot expressie kwamen, gekleurd zijn.

Binnen de pathway werden verschillende veranderingen in genexpressie waargenomen. In de interactie tussen immuuncellen waren onder andere CD80/86, CD28, CTLA4, LFA1 en IL15 verhoogd tot expressie gebracht, terwijl MHCII verlaagd was. Binnen ontstekingsgerelateerde componenten waren onder andere IL1 en IL1B verhoogd tot expressie gebracht. Ook verschillende chemokinen, waaronder CCL2 en CXCL1, vertoonden een verhoogde expressie.

Binnen de VEGF-gerelateerde route was Tie2 verhoogd tot expressie gebracht, terwijl onder andere VEGF en CXCL5 een lagere expressie vertoonden. Daarnaast werd binnen de weefselafbraakroute een verhoogde expressie van MMP13 waargenomen. Componenten die betrokken zijn bij osteoclastactiviteit, waaronder CTSL en V-ATPase, vertoonden juist een lagere expressie.

De Pathview-analyse laat daarmee zien dat meerdere genen binnen de Rheumatoid Arthritis-pathway differentieel tot expressie komen, met veranderingen in onder andere immuunactivatie, ontstekingssignaling, angiogenese en weefselafbraak.

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

<sub><b>Figuur 6.</b> <i>***KEGG Rheumatoid Arthritis-pathway (hsa05323) met differentiële genexpressie tussen ACPA-positieve RA-patiënten en ACPA-negatieve controles. (A) De volledige Rheumatoid Arthritis-pathway met alle genen en eiwitten die volgens KEGG onderdeel zijn van de pathway. Genen uit de differentiële-expressieanalyse die aan deze pathway zijn gekoppeld, zijn gekleurd. (B) De differentiële genexpressie van pathway-genen in RA ten opzichte van controles, weergegeven als log2 fold change. Rode kleur geeft verhoogde expressie en groene kleur verlaagde expressie in de RA-groep ten opzichte van de controlegroep weer; de kleurintensiteit geeft de mate van verandering weer. Niet-gekleurde genen zijn niet differentieel tot expressie gekomen volgens de gebruikte selectiecriteria (padj < 0,05 en |log2 fold change| > 1).***.</i></sub>



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





  
