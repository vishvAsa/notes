+++
title = "Indian forming chart"
js_extras = ["mermaid"]

+++

```mermaid
graph TD
    %% --- Section 1: Out of Africa & Early Splits ---
    A[Humans come out of Africa]
    A --> Branch_Papuan["the branch leading to part of the ancestry of the Papuans and the Australian aborigines..."]
    A --> Ancestral_Eurasian["the ancestral 'Eurasian branches' situated in Inner Eurasia - splits 45-36.2k BP"]
    A --> Onge_Ancestor["the common ancestor of the Onge of the Andamans and the main-land proto-Indians..."]
    Onge_Ancestor -.-> Pre_Americans

    Ancestral_Eurasian --> East_Asians[East Asians]
    Ancestral_Eurasian --> Western_Eurasians[Western Eurasians]

    %% --- Section 2: East Asian & American Lineage ---
    East_Asians --> Pre_Americans["Ancestors of Native Americans, Mongols, Turks, Siberians. Q1a Y clade."]

    %% --- Section 3: Proto-Indian Lineage ---
    Onge_Ancestor --> Proto_Indian[Proto Indian population]
    Proto_Indian --> Ganga_Neolithic["Possible Ganga neolithic agriculture"]
    Proto_Indian --> Mehrgarh["Mehrgarh Neolithic agriculture 9-10 kyr BP (No ancient genomes)"]
    Proto_Indian --> Harappan["Harappan bronze age civilization"]
    
    %% --- Section 4: Western Eurasian Hunter-Gatherers ---
    Western_Eurasians --> ANE["Ancestral North Eurasians (ANE) ~24 kyr BP in Siberia"]
    ANE -.-> Pre_Americans
    Western_Eurasians --> PreHG["Many groups 9-7k BP"]
    PreHG --> EHG["Eastern hunter gatherers EHG"]
    PreHG --> WHG["Western Euro hunter gatherers (WHG) SLC24A5 dark skin allele, HERC2/OCA2 allele blue eyes fixed"]
    PreHG --> SHG["Scandinavian hunter gatherers SHG"]
    
    PreHG --> LightSkin["SLC4SA5 Light skin allele fixation"]
    LightSkin --> CHG["Caucasian hunter gatherers (CHG) SLC4SA2 dark skin allele"]

    %% --- Section 5: Neolithic Farmers ---
    LightSkin --> Anatolia_EF["Neolithic Early Farmers (EF) in Anatolia"]
    Anatolia_EF --> Euro_Farmers["8-7.5 kyr Neolithic Euro farmers"]
    Euro_Farmers --> Danube["Danube system"]
    Danube --> MN_Farmers["Middle Neolithic farmers - 6.5kyr BP"]
    EHG --> MN_Farmers
    Euro_Farmers --> Sardinians["Sardinians, Spaniards, Basque"]

    %% --- Section 6: Yamnaya Formation (The Steppe) ---
    EHG --> Steppe_MLBA["~EHG (42-52%)- CHG(48-58%)7.2-5 kyr BP to Bronze age Middle Volga/ Samara, pontic steppes"]
    CHG --> Steppe_MLBA
    Steppe_MLBA --> Maikop["Maikop culture in Caucus. straddles steppe and Mid East cultures. Trade with Harappa. Wheel and charriot."]
    Steppe_MLBA --> PIE["Proto Indo Europeans. Chakra and ratha words."]
    PIE --> GrArIIr["Sintashta/ Srubnaya > Andronovo?? Or Sintashta branch?"]

    %% --- Section 7: Yamnaya Expansions & Descendants ---
    PIE --> Yamnaya["Yamnaya culture dated ~5.0-4.3 kyr BP Proto-IE Increased height, SLC45A2 light skin allele at 0.7 freq, lactose tolerance only 0.25 freq. predominantly R1b Y chr."]
    PIE --> Hittites
    Yamnaya --> Altai_Invasion["Altai Invasion 5.3-5 kyr BP"]
    Yamnaya --> Massive_EU_Invasion["Massive EU Invasion ~4.9 kyr BP. Germanic, Italic and Celtic groups"]
    Massive_EU_Invasion --> Corded_Ware["Corded ware/ battle axe culture ~4.9 kyr BP Central Europe ~4.3 kyr BP reaches Atlantic"]
    MN_Farmers --> Corded_Ware
    Corded_Ware --> Light_Skin_Lactose["SLC45A2 light skin allele fixed, rs4988235 in the LCT gene region for lactose tolerance at 0.7 freq."]
    Yamnaya --> Baltic_Slavic["Baltic and Slavic groups. Left after Germans etc... Contact evident with Indo Iranians... Possibly from Poltavka."]
    GrArIIr --> Greeks_Armenians["Greeks, Armenians"]

    %% --- Section 9: Sintashta/Andronovo & Proto-Indo-Iranians ---
    Altai_Invasion --> Afanasievo["Alfenaslevo culture Tocharian IE"]
    Afanasievo --> Okunevo["Okunevo culture in Altai. Distinct."]
    Pre_Americans -.-> Okunevo
    Okunevo --> Andronovo_Intrusion["Andronovo Intrusion"]
    Andronovo_Intrusion --> Karasuk["Karasuk culture"]
    Karasuk --> Uighurs

    Yamnaya --> Sintashta_Complex["Sintashta-Potapovka- Filatovka complex, large scale metal works, forts, towers, ditches, weapons, spoke wheel chariots, elaborate jewels"]
    Sintashta_Complex --> Filatovka["Filatovka/Kondrashevka culture in the upper reaches of the Don river -- ~4.1 kyr"]
    Sintashta_Complex --> EF_Infusion["17% EF Infusion, rise of R1a Y chromosome haplogroup"]
    Anatolia_EF -.-> EF_Infusion

    EF_Infusion --> Poltavka["Poltavka culture (~4.9-4.2 kyr) same place as Yamnaya. R1b dominates."]
    EF_Infusion --> Indo_Iranians_R1a

    Poltavka --> Srubnaya["3.9-3.8 kyr BP Srubnaya culture. R1a-Z93 Same place as Yamnaya."]
    Indo_Iranians_R1a --> Srubnaya

    Indo_Iranians_R1a --> Sintashta["Sintashta culture in the east in the zone between the Urals and the Tobol river ~4.1kyr"]

    Sintashta --> Seima_Turbino["Seima-Turbino phenomenon, Andronovo culture. 3.9-3.8 kyr BP, Sn- bronze. R1a-Z93 (R1a1a1b2) appears."]
    Andronovo_Intrusion -.-> Seima_Turbino
    Seima_Turbino --> Eurasia_Expansion["Expansion over all of central Eurasia"]


    %% --- Section 10: Indo-Aryan Migration ---
    GrArIIr --> Indo_Iranians_R1a["Indo Iranians. R1a-Z93 (R1a1a1b2) dominates."]

    Indo_Iranians_R1a --> India_Invasion_BMAC["CHG Invasion of India? Mixture with CHG in Bactria-Margiana complex (BMAC)?"]

    India_Invasion_BMAC --> India_Trade["India trade, Intervention and invasion"]
    Harappan -.-> India_Trade


    %% --- STYLING ---
    style A fill:#3c91e6,stroke:#333,stroke-width:2px
    style PIE fill:#ff9900,stroke:#333,stroke-width:2px
    style Indo_Iranians_R1a fill:#ff9900,stroke:#333,stroke-width:2px
    style India_Trade fill:#ff9900,stroke:#333,stroke-width:2px
```



<details><summary>विस्तारः (द्रष्टुं नोद्यम्)</summary>

 [20151212](https://manasataramgini.wordpress.com/2015/12/12/a-note-on-the-early-expansions-of-the-indo-europeans/) 
 
- [mermaidchart](https://rebrand.ly/IA_MT)
- [img](../images/mt_2015.png),
- mindmap mup base file [here](https://drive.google.com/file/d/1NOmH-j3NARqK7pDt8Gq2EJyVJ2xHvNr9/view?usp=sharing))
</details>

## Geographic overlay
![](../genetics/images/yAmnAya_corded-ware_baltic-fatyanovo_abashevo_sintashta_andronovo_nordquvist_2020.png)
{caption="Geographic overlay"}