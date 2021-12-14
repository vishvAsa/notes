+++
title = "Diagnosis"
+++

## Presymptomatic phase
Infection can be 2-14 days before symptoms appear. CDF from  https://www.acpjournals.org/doi/10.7326/M20-0504 below.

{{< figure src="../images/cumulative_distribution_function_of_the_covid-19_incubation_period_estimate.jpg" title="" class="thumbnail">}}

So, a 10 day quarantine catches about 90% of the cases. 11.5 days (CI, 8.2 to 15.6 days) for 97.5% of infected persons 

## Symptoms
### Major
- Fever
- Cough
- Shortness of breath

### Minor
- Tiredness, body ache, sore throat, diarrhea, vomiting
- stuffy nose, Loss of smell

### Case studies
- 2021 Apr - puNe. याजुषी.
  - आरम्भे ज्वरः। महती श्रान्तिः। ततोऽग्रे किञ्चिदिव कासः। ज्वरेऽपगते महाश्रान्तिः। स्थातुमपि न शक्यते तादृशी। अधुनैव शनैः शनैः सामान्यकार्याणि कर्तुं शक्नोमि।
  - गृहे अन्येषां तु पूर्वं कासः ततः ज्वरः। पुत्रयोः उभयम्। तयोः शीघ्रमेव लक्षणमुक्तिरभूत्।
  - रोगमुक्तिस्तु टेस्ट कृत्वैव ज्ञायेत। श्रान्तिरेवैकं महत्कष्टम्।
- 2020 Aug - Devanahalli, BLR. Patient and wife reported fever which came and went for about 4 days. Then, pulse oxymeter showed 92% saturation in patient. He tested positive.
- When on oxygen, saturation level is 95, but when he goes to toilet etc.., it comes down to 80.

### Big list
Respiratory symptoms 

- Breathlessness 
- Cough 

Cardiovascular symptoms 

- Chest tightness 
- Chest pain 
- Palpitations 

Generalised symptoms 

- Fatigue 
- Fever 
- Pain 

Neurological symptoms 

- Cognitive impairment ('brain fog', loss of concentration or memory issues) 
- Headache 
- Sleep disturbance 
- Peripheral neuropathy symptoms (pins and needles and numbness) 
- Dizziness 
- Delirium (in older populations) 

Gastrointestinal symptoms 

- Abdominal pain 
- Nausea 
- Diarrhoea 
- Anorexia and reduced appetite (in older populations) 

Musculoskeletal symptoms 

- Joint pain 
- Muscle pain 

Psychological/psychiatric symptoms 

- Symptoms of depression 
- Symptoms of anxiety 

Ear, nose and throat symptoms 

- Tinnitus 
- Earache 
- Sore throat 
- Dizziness 
- Loss of taste and/or smell 

Dermatological 

- Skin rashes

## Tests for infection
- "RT-PCR remains the gold standard for the diagnosis of COVID-19 in sputum samples. However, the combination of different diagnostic tests is highly recommended to achieve adequate sensitivity and specificity."

### Test metrics
- See [here](/notes/math/probability/statistics/label_prediction/risk_and_evaluation/Loss_functions_labeling_multiple_data_points/) for intro.

### Sample collection
- Saliva better - "saliva viral load was significantly higher in those with COVID-19 risk factors; that it correlated with increasing levels of disease severity and showed a superior ability over nasopharyngeal viral load as a predictor of mortality over time (AUC=0.90)."
- nasopharynx swabs.

### RNA detection
#### RT-PCR
- Intro [elsewhere](../../../diagnosis/).
- "The current RT-PCR has a sensitivity at best of 70 percent with a turn around time of 120 minutes."
- For RT-PCR tests, rectal stools/swab, urine, and plasma were less sensitive while sputum (97.2% [90.3%-99.7%]) presented higher sensitivity for detecting the virus.  [pubmed](https://pubmed.ncbi.nlm.nih.gov/32659413/)
- The CT (cycle threshold) value indicates the number of cycles in the RT-PCR test which are needed to amplify viral RNA to a detectable level. A low CT value (less than 25) indicates a high viral load and it significantly improves the chances of genomic sequencing. If the CT value is high, then sequencing becomes difficult.
￼

#### Crisper based
- A Crisper based diagnostic testing tried out in Thailand offers 97-100 percent sensitivity to detect the virus and has a turn around time of 75 minutes.


### Paper antigen tests
- Rapid, inexpensive paper strip tests can tell you whether you are contagious. Research shows that if taken frequently, these tests will drive down infections. [RT](https://www.rapidtests.org/) 
- ICMR [advisory](https://www.icmr.gov.in/pdf/covid/strategy/Advisory_for_rapid_antigen_test14062020.pdf), validated kits [here](https://www.icmr.gov.in/pdf/covid/kits/List_of_rapid_antigen_kits_29102020.pdf).
- Tackling false positives - use different antigen test strip.
- Maximum duration for interpreting a positive or negative test is 30 minutes. After that the test strip should be discarded.

## Severity tests
### Blood tests
- Get a Complete Blood Count (CBC) and C-reactive Protein (CrP) test as soon as ANY symptoms appear. This is an inexpensive (<1k) and relatively fast (although taking 24+ hours in Delhi now) test that is extremely important to measure severity of infection - detects tissue damage and infection signs.

### CT scans
- High resolution computed tomography (HRCT)
- At prevalance 15%, 20200822
  - Sensitivity (fraction of positives caught) - 86%
  - Specificity (fraction of negatives marked as negative) - 18%
- CT scans need you to travel to labs + cost >5k and reports are available in a few hours.
- CT scan 18+/25 is terrible. [202104 Victoria Hospital BLR shivakumAr](https://www.facebook.com/publictv/videos/2559427477695126)

### Antibody tests
- Prick blood and put on test strip.
- "The combination of IgM and IgG antibodies demonstrated promising results for both parameters (84.5% [82.2%-86.6%]; 91.6% [86.0%-95.4%], respectively). "

### Oxygen levels
- [Pulse oximeters]() help diagnose the infection. 
- For SpO2 below 92-93, you might need hospitalisation. Before making that call, take a 6-min walk test. If levels rise, good. Else go to a hospital where oxygen therapy & some steroids will be given.

### Aggregation
- If O2 sat. is remaining above 95 and CrP is below 5 on Day 5, then in all likelihood one is out of the woods.
- If the sat is dropping (<93) and CrP is still high by Day 5 -> needs stronger medication