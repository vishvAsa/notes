+++
title = "Rudraṭa knights tour - GSS Murthy"
+++


The Knight’s Tour Problem and Rudraṭa’s Verse:

A View of the Indian Facet of the Knight’s Tour


By

G S S Murthy

[Affiliation: FIETE; Corresponding author: G S S Murthy Email:murthygss gmail]


## Abstract

_If a chess-knight is moved on a vacant chess-board [8x8 square] such that it visits each one of the 64 squares once and once only, the knight is said to execute a Knight’s Tour. Solution to the knight’s tour problem was known in India as early as the 9<sup>th</sup> century AD as a demonstration of wizardry in composing 32-syllable verses in Sanskrit. A pair of meaningful verses is composed in such a manner that when one verse is written serially (left to right and top to bottom) one syllable a square to fill up 8x4 cells –half of a chess board- the other verse appears as the Knight’s Tour. The earliest example of this skill in poetry-composition is given in a Sanskrit treatise on poetics, kāvyālaṅkāra written by Rudraṭa who lived around the ninth century A.D. Knight’s Tour as a mathematical problem was first noticed and discussed in the West by Leonard Euler in the eighteenth century. After providing the back ground to the subject as a puzzle on the chess-board, a problem in mathematics and as a challenge in verse-composition, the article discusses the special characteristic of Rudrata’s example where the pair of verses reduces to a single verse._

_[ Key Words: Knight’s Tour Problem_, _Rudrata_, _citrakāvyam, turaṅga-padam, Sanskrit literature, cyclic permutation ]_

 

## 1.0 Introduction

 

If a chess-knight is moved on a vacant chess-board [8x8 celle] such that it visits each one of the 64 squares once and once only, the knight is said to execute a Knight’s Tour. The particular sequence of squares which the knight takes is the path of the knight’s tour. [In this article, we shall use the word “cell” to denote “square”.] Working out a path is actually a mathematical problem and it is not at all easy to come up with a solution, by trial and error.

 

Solution to the knight’s tour problem was known in India as early as the 9<sup>th</sup> century AD in the guise of exemplary skill in composing 32-syllable verses in Sanskrit. A pair of meaningful verses is composed in such a manner that when a specified verse of the pair is written serially (left to right and top to bottom) one syllable a cell to fill up 8x4 cells –half of a chess board- the other verse follows the path of the Knight’s Tour. The verses have to not only meet the requirements of prosody but also have to be contextually meaningful. The earliest example of this skill in poetry-composition is given in a Sanskrit treatise on poetics, kāvyālaṅkāra written by Rudraṭa who lived around the ninth century A.D. This type of literary wizardry in Sanskrit comes under the general category, citrakāvyam, which could be translated as “figure-poetry” or “amusing poetry”. “Citrakāvyam” is again a sub-category of “Śabda alaṅkāra”, which deals with “word-based ornamentation” of poetry.

 

The knight’s tour problem which would have originated as a puzzle on the chess-board was later taken up as a problem in Mathematics. However in India it showed itself up as a way of demonstrating exemplary skill in composing verses in Sanskrit. The following paragraphs give a brief introduction to the knight’s tour problem, as a puzzle on the chess-board, as a problem in mathematics and as a challenge in verse-composition in Sanskrit.

 

## 2.0 Knight’s tour as a chess puzzle

 

It is believed that Chess had its origin in India, where it is called caturanga(having four divisions). A 12<sup>th</sup> century work Mānasollāsaḥ of king Someśvara, an encyclopaedic compendium meant for a king describes inter alia the game of caturanga. From a perusal of this work, one could surmise the following equivalence in the names of the pieces: rook = ratha (chariot), knight= turaga (horse), bishop= gaja (elephant), king =rājā (king), queen= mantrī (minister) and pawn =padāti (foot-soldier)[^1]. The game seems to have spread from India via Persia to Arab countries where it was called “shatranj”, an obvious distortion of “caturanga”. The Sanskrit name for the manner a knight moves on the chess board is “turaga-pada”.

 

A 10<sup>th</sup> century Arab, Abu Bakr Al-suli, who was a king’s companion, known for his skill in playing chess, wrote a book in Arabic on chess strategy, where he discussed the knight’s tour problem as a chess-puzzle [[https://en.wikipedia.org/wiki/Abu_Bakr_bin_Yahya_al-Suli](https://en.wikipedia.org/wiki/Abu_Bakr_bin_Yahya_al-Suli)]. Mānasollāsaḥ, referred to above, which was written two centuries later also describes a solution of Knight’s tour as a puzzle. It is interesting to see how Someśvara, the author of Mānasollāsaḥ explains the solution. First he provides a co-ordinate system for the 8x8 chess board. For reasons of his own, he chooses the consonants c,g,n,d, ṭ,r,s,p to denote the 8 columns (or rows) and vowels “a ā i ī u ū e ai” to denote the 8 rows (or columns). The resulting co-ordinate system for the 8x8 chess board will be as shown in Fig. 1. Any cell is uniquely defined by the combination of the chosen consonant and vowel.


|   | A | B  | C  | D  | E | F | G | H |
|---|---|----|----|----|---|---|---|---|
| 1 | च | चा | चि | ची | चु | चू | चे | चै |
| 2 | ग | गा | गि | गी | गु | गू | गे | गै |
| 3 | न | ना | नि | नी | नु | नू | ने | नै |
| 4 | द | दा | दि | दी | दु | दू | दे | दै |
| 5 | ट | टा | टि | टी | टु | टू | टे | टै |
| 6 | र | रा | रि | री | रु | रू | रे | रै |
| 7 | स | सा | सि | सी | सु | सू | से | सै |
| 8 | प | पा | पि | पी | पु | पू | पे | पै |

Fig 1. Co-ordinate system of Someśvara.

Now he gives the knight’s tour as a sequence of 64 syllables broken into 8 sets of 8 syllables for convenience in memorizing. The 8 sets are as follows:

pa si pu se ṭai ne cai gū ।

nī cu gi ca nā ṭa sā pī ।

sū pai re dai ge dū gu ci ।

ga dā ra pā sī pū sai ṭe ।

nai ce nū gai cū gī cā na ।

ṭā sa pi su pe rai de nu ।

ṭū rī di ṭu ri dī ru ṭi ।

du ni cī gā da rā ṭī rū ।

[प सि पु से टै ने चै गू ।

नी चु गि च ना ट सा पी ।

सू पै रे दै गे दू गु चि ।

ग दा र पा सी पू सै टे ।

नै चे नू गै चू गी चा न ।

टा स पि सु पे रै दे नु ।

टू री दि टु रि दी रु टि ।

दु नि ची गा द रा टी रू ।]

These sequences are devoid of any meaning or prosodic constraints.

The resulting knight’s tour is shown in Fig 2. The knight’s tour can be traced by following the numbers in the cells 1,2,3 ---64.


|   | A   | B    | C    | D    | E   | F   | G   | H   |
|---|-----|------|------|------|-----|-----|-----|-----|
| 1 | 12च | 39चा | 24चि | 59ची | 10चु | 37चू | 34चे | 7चै  |
| 2 | 25ग | 60गा | 11गि | 38गी | 23गु | 8गू  | 21गे | 36गै |
| 3 | 40न | 13ना | 58नि | 9नी  | 48नु | 35नू | 6ने  | 33नै |
| 4 | 61द | 26दा | 51दि | 54दी | 57दु | 22दू | 47दे | 20दै |
| 5 | 14ट | 41टा | 56टि | 63टी | 52टु | 49टू | 32टे | 5टै  |
| 6 | 27र | 62रा | 53रि | 50री | 55रु | 64रू | 19रे | 46रै |
| 7 | 42स | 15सा | 2सि  | 29सी | 44सु | 17सू | 4से  | 31सै |
| 8 | 1प  | 28पा | 43पि | 16पी | 3पु  | 30पू | 45पे | 18पै |

Fig. 2 Knight’s tour of Someśvara

Someśvara also gives the possible knight moves from various cells as per the following:

koṇapārśvasthitasyāsya turagasya padatrayam । 573 ॥

koṇasthasya padadvandvaṃ prānte padacatuṣṭayam ।

dvitīyavalaye koṇe haye padacatuṣṭayam ॥

dvitīyavalaye'nyatra padaṣaṭkaṃ nigadyate ।

madhye ṣoḍaśa[koṣṭheṣu] sthitasya turagasya ca ॥

padāṣṭakaṃ vinirdiṣṭaṃ caturaṅgaviśāradaiḥ ॥

[कोणपार्श्वस्थितस्यास्य तुरगस्य पदत्रयम् । ५७३ ॥

कोणस्थस्य पदद्वन्द्वं प्रान्ते पदचतुष्टयम् । द्वितीयवलये कोणे हये पदचतुष्टयम् ॥

द्वितीयवलयेऽन्यत्र पदषट्कं निगद्यते । मध्ये षोडश[कोष्ठेषु] स्थितस्य तुरगस्य च ॥

पदाष्टकं विनिर्दिष्टं चतुरङ्गविशारदैः ॥]

A rough translation of this is given below:

“When the knight is in the corner, it has 2 moves; when it is in the cell beside the corner it has 3 moves.  If it is in the side (other than the corner and the next cell) it has 4 moves; if it is in the corner of the second enclosure (inner 6x6 square) it has 4 moves, elsewhere in the second enclosure, it has 6 moves; In the central 16 cells it has 8 moves”. [ Fig. 3]

|    |   |   |   |   |   |   |   |   |
|----|---|---|---|---|---|---|---|---|
| 1  | 2 | 3 | 4 | 4 | 4 | 4 | 3 | 2 |
| 2  | 3 | 4 | 6 | 6 | 6 | 6 | 4 | 3 |
| 3  | 4 | 6 | 8 | 8 | 8 | 8 | 6 | 4 |
| 4  | 4 | 6 | 8 | 8 | 8 | 8 | 6 | 4 |
| 5  | 4 | 6 | 8 | 8 | 8 | 8 | 6 | 4 |
| 6  | 4 | 6 | 8 | 8 | 8 | 8 | 6 | 4 |
| 7  | 3 | 4 | 6 | 6 | 6 | 6 | 4 | 3 |
| 8  | 2 | 3 | 4 | 4 | 4 | 4 | 3 | 2 |

Fig. 3 Possible moves for a knight as per Someśvara



One needs to appreciate the precision and brevity Someśvara has achieved in the above explanation in Sanskrit.

 

## 3.0 Knight’s tour as a problem in mathematics

 

It is only in the 18<sup>th</sup> century that the famous mathematician and physicist Leonard Euler heard of the chess puzzle and looked at it as a problem in mathematics. One of the solutions to the problem given by Euler is shown in Fig. 4.[ [https://www.researchgate.net/publication/265424016_Knight's_tours_for_cubes_and_boxes](https://www.researchgate.net/publication/265424016_Knight's_tours_for_cubes_and_boxes)]



|    |    |    |    |    |    |    |    |
|----|----|----|----|----|----|----|----|
| 1  | 26 | 15 | 20 | 7  | 32 | 13 | 22 |
| 16 | 19 | 8  | 25 | 14 | 21 | 6  | 31 |
| 27 | 2  | 17 | 10 | 29 | 4  | 23 | 12 |
| 18 | 9  | 28 | 3  | 24 | 11 | 30 | 5  |

Fig 4. Euler’s knight’s tour

His solution fills up the bottom-half of a 8x8 chess-board. But the solution is such that the 33<sup>rd</sup> move of the knight can take it to the bottom right corner cell of the top-half. A little reflexion will show that the top-half can be easily filled up following the route of the bottom-half. The 64<sup>th</sup> cell that the knight occupies is such that it can jump to the 1<sup>st</sup> cell. The solution is therefore re-entrant and the knight can indefinitely keep moving in the end-less circuit. Euler showed how new solutions can be generated from known solutions and how incomplete solutions could be repaired to lead to a knight’s tour. Euler also showed how solutions for larger chess-boards, say having 10x10 cells, could be obtained by suitably patching up solutions for smaller boards.

 

The next important work in arriving at a solution for the knight’s tour problem was by Warnsdorff in the 19<sup>th</sup> century who gave a heuristic rule for choosing the next move for the knight.[ [https://en.wikipedia.org/wiki/Knight%27s_tour#Warnsdorff's_rule](https://en.wikipedia.org/wiki/Knight%27s_tour#Warnsdorff's_rule)] As per Warnsdorff the knight should be moved to the cell from which the knight will have the fewest onward moves. Let us take an example for understanding this rule:

|   | A | B | C | D | E | F | G | H |
|---|---|---|---|---|---|---|---|---|
| 1 | 1 |   |   |   | 7 |   |   |   |
| 2 |   |   | x |   |   |   | 6 |   |
| 3 |   | 2 |   | x |   | 4 |   |   |
| 4 |   |   |   | 3 |   |   |   | 5 |

Fig. 5 Warnsdorff Rule


Fig. 5 shows a partially filled knight’s tour where the knight has reached the 7<sup>th</sup> cell of the tour. For the next step there are 2 choices either cell C2 or cell D3. We see that from cell C2, three choices are available (A3,B4,E3) and from cell D3, 5 choices (C1,B2,B4,F4,F2) are available. As per Warnsdorff Rule, one should choose cell C2 which has less number of choices (3) and not D3 which has 5 choices. It is, of course, possible to have two or more choices for which the number of onward moves is equal; there are various methods for breaking such ties and we shall not go into the details.

 

If we now have a re-look at Fig. 3 which gives the number of possible moves for a knight as per Someśvara, a thought occurs if around the 12<sup>th</sup> century a rule similar to Warnsdoff rule was known among experts in the field in India.

 

Research work on the mathematics of the knight’s tour problem proliferated in the 20<sup>th</sup> century in several directions, such as extending the problem to squares and rectangles of different sizes and 3-D cuboids, calculating the number of all possible solutions etc. Treating the knight's tour problem as a simpler instance of the more general [Hamiltonian path problem](https://en.wikipedia.org/wiki/Hamiltonian_path_problem) in [graph theory](https://en.wikipedia.org/wiki/Graph_theory), attempts have been made for finding out clever heuristics and efficient algorithms for arriving at a solution.

 

In recent times Prof. D E Knuth, well known mathematician and computer theorist, has studied the problem and its history extensively and credit is due to him for having discovered and publicized the fact that the earliest solution to the problem originated in India not later than 9<sup>th</sup> Century AD. There are strips of his lectures on You Tube [[https://www.youtube.com/watch?v=C95hHI7cVNs](https://www.youtube.com/watch?v=C95hHI7cVNs)] which give a glimpse of his deep interest in the subject.

 

## 4.0 Śabda alaṅkāra (word-based ornamentation) and Citrakāvyam (Figure-poetry)

 

Before we get into the details of knight’s tour as a display of literary wizardry in Sanskrit, it is worthwhile knowing the background to such skills and their place in Sanskrit literature. We shall therefore provide a brief introduction to Śabda alaṅkāra and Citrakāvyam in the foregoing.

 

Alliteration and rhyming are well recognized as techniques in composing verses and competent poets have judiciously employed them to advantage. Corresponding words in Sanskrit are “anuprāsa”(alliteration) and “yamaka” (rhyming). While the word, “rhyming” is often associated with the end of lines in a verse, “yamaka” has a broader meaning in Sanskrit.

 

When a consonant is repeatedly used in a line of verse, it is called “anuprāsa”. If the repeated consonant is soft it could accentuate a mood of love or melancholy and if it is hard it could enhance a mood of valour and war. However, when a sequence of syllables is repeatedly used in a verse it is called “yamaka”. The sequence by itself need not be meaningful and even when meaningful, more often than not, the meaning will be different at each instance of repetition. “Anuprāsa” and “yamaka” were the earliest forms of  “Śabda alaṅkāra”, namely “word-based ornamentation”. Vālmīki’s Rāmāyaṇam, which holds an exalted position in world literature and which perhaps was written in 2<sup>nd</sup> century BC, has a display of yamaka (repetition of syllabic sequences) in the 5<sup>th</sup> canto of the 5<sup>th</sup> book, Sundarakāṇḍa as the following verse exemplifies:

tataḥ sa madhyaṃgatamaṃśu<span style="text-decoration:underline;">mantaṃ</span> jyotsnāvitānaṃ muhurudva<span style="text-decoration:underline;">mantam</span> ।

dadarśa dhīmān bhuvi bhānu<span style="text-decoration:underline;">mantaṃ</span> goṣṭhe vṛṣaṃ mattamiva bhra<span style="text-decoration:underline;">mantam</span> ॥

[ततः स मध्यंगतमंशुमन्तं ज्योत्स्नावितानं मुहुरुद्वमन्तम् ।

ददर्श धीमान् भुवि भानुमन्तं गोष्ठे वृषं मत्तमिव भ्रमन्तम्  ॥5-5-1||]

“Then intelligent Hanuman looked at the brilliant Moon in the zenith of the sky spewing frequently a spread of moon-light, and wandering like a proud bull in its enclosure.”

One cannot miss the pleasing repetition of the sequence "mantam”[मन्तम्] and the fact that at each instance of repetition it occurs as a part of a different word.

Kālidāsa who could not have been later than 5<sup>th</sup> century AD indulges in yamaka in his work Raghuvaṃśam at places. By the time poet Bhāravi composed his magnum opus, “Kirātārjunīyam” an epic poem sometime earlier to 7<sup>th</sup> century AD, Śabda alaṅkāra had widened its base beyond “anuprāsa” and “yamaka”. In the 15<sup>th</sup> canto of Kirātārjunīyam, Bhāravi demonstrates “Gomūtrikābandha” one of the earliest forms of citrakāvyam in the following verse. The verse is written in a figure [Fig. 6] which represents the zig-zag path traced on the ground by the urine of a cow as it urinates while walking. (go=cow, mūtra =urine, bandha=constraint)

|    |   |    |   |   |    |    |    |   |   |    |     |    |    |    |    |
|----|---|----|---|---|----|----|----|---|---|----|-----|----|----|----|----|
|    |   | रो |   |   |    | ना |    |   |   | सं  |     | न  |    | क्ष |    |
| ना | सु |    | यं | न | वा |    | गो | ध | र |    | स्थो |    | रा |    | सः |
|    |   | खो |   |   |    | भो |    |   |   | णि |     | हि |    | ज  |    |

Fig. 6: Gomūtrikābandha of Bhāravi


nāsuro'yaṃ na vā nāgo dharasaṃstho na rākṣasaḥ ।

nāsukho'yaṃ na vā bhogo dharaṇistho hi rājasaḥ ॥

[नासुरोऽयं न वा नागो धरसंस्थो न राक्षसः ।

नासुखोऽयं न वा भोगो धरणिस्थो हि राजसः ॥]

(“He is not a daitya; he is not a nāga(serpent); he is not a demon of mountainous proportions; He is just a pleasant enthusiastic energetic human being walking on this earth.”)

 

Similarly diagrams may represent a sword, a wheel, a lotus of 4,8,12,16 petals and such figure-verses are named after the thing the  figure represents, khaḍga-bandha (sword), cakra-bandha (wheel), aṣṭa-dala-padma-bandha (8-petalled lotus) etc. The main feature of these figure-verses (often called “citrabandha”s) is that some syllables are repeatedly used as pivots.

 

While Bhāravi demonstrated only three types of figure-verses, Rājānaka Ratnākara who is believed to have lived in the 9<sup>th</sup> century devotes the 48th canto of his Haravijayam to several types of citrabandhas, where he has attempted the knight’s tour also. Haravijayam is the earliest of the poetic works where we come across the knight’s tour. Rudraṭa, who wrote, “Kāvyālaṅkāra”, a treatise on Literary Theory in the 9<sup>th</sup> century was the earliest among literary theorists who discussed śabda alaṅkāras and especially citrakāvyam including knight’s tour in detail. We could thus say that citrakāvyams had reached a stage of maturity by the time of Rudraṭa and that they came into vogue during the 8<sup>th</sup>-9<sup>th</sup> centuries.

There are other types of constraints, employed in citrakāvyam, such as the following:



1. The verse does not contain certain types of consonants say labials (pa-varga) or gutturals (ka-varga).
2. The verse contains 1, 2 or 3 consonants only.
3. The verse uses only one syllable. An example is

yāyāyāyāyāyāyāyāyāyāyāyāyā ।

yāyāyāyāyāyāyāyāyā yā yā yā yā yā yā yā ॥ Pādukāsahasram-30-26 ॥

[यायायायायायायायायायायायाया ।

यायायायायायायायाया या या या या या या या ॥ पादुकासहस्रम्-३०-२६ ॥]



1.
The verse when read in reverse yields another meaningful, contextually relevant verse. There are works of this type where the verses, when read normally, narrate one story and when read in reverse narrate another story.


1.
The verse written row-wise in a matrix yields another verse or same verse when read as per a specified manner. Knight’s tour comes in this category.


Two factors associated with Sanskrit facilitate such literary acrobatics. 1. Possibility of splitting a compound word in different ways as per the rules of sandhi[^2] and samāsa[^3] 2. Existence of a large number of words which have multiple meanings.

Later literary theorists who were not just compilers of knowledge but were also original thinkers did not speak highly of word-based ornamentations (śabda alaṅkāra s) as they could only be understood by the very learned among connoisseurs and as they often resulted in semantic banality. However, citrakāvyam continued to be popular among aspiring poets as a means of demonstrating their wizardry in versification. We thus see competent poets indulging in these literary acrobatics right up to the 20<sup>th</sup> and 21st[^4] centuries.

 

## 5.0 Verse-pairs for Knight’s Tour

 

We shall now have a look at two verse-pairs composed as knight’s tour (turagabandha) the first by Vedāntadeśika in Pādukāsahasram and the second by Rājānaka Ratnākara in Haravijayam.

 

Vedāntadeśika who lived in the later part of the 13<sup>th</sup> century was a pious devout person who led a simple life, an erudite scholar who wrote philosophical treatises and a gifted poet whose literary works have earned him a place among the pantheon of great Sanskrit poets. His work Pādukāsahasram<sup> </sup> consisting of 1000 verses is a hymn to the sandals of Śrīrāma which were worshipped by Bharata when the former lived in the forests. The work has 32 cantos and the 30<sup>th</sup> canto called citrapaddhati consists of 40 verses where Vedāntadeśika demonstrates his skill in citrabandhas and in every possible type of literary jugglery. Needless to say that it is not easy to understand the meaning of these verses without the help of a commentary written by an equally competent and erudite scholar.




|      |      |      |      |     |      |      |       |
|------|------|------|------|-----|------|------|-------|
| स्थि1 | रा30 | ग9   | सां20 | स3  | दा24 | रा11 | ध्या26 |
| वि16 | ह19  | ता2  | क29  | त10 | ता27 | म4   | ता23  |
| स31  | त्पा8 | दु17  | के14  | स21 | रा6  | सा25 | मा12  |
| रं18  | ग15  | रा32 | ज7   | प28 | द13  | न्न22 | य5    |


Fig 7. Vedāntadeśika’s knight’s tour verses
 

In this work of his, the pair of verses which demonstrates knight’s tour is as follows [Fig. 7].:

sthirāgasāṃ sadārādhyā vihatākatatāmatā ।

satpāduke sarā sāmā raṃgarājapadannaya ॥

स्थिरागसां सदाराध्या विहताकततामता ।

सत्पादुके सरासा मा रङ्गराजपदं नय ॥ 30-19||

[ Oh Sandal-pair of the Creator! You are to be worshipped all the time by the ordinary folk whose sins are ever present. You demolish the sorrows and unpleasant happenings. Lead me jingling to the feet of God]

sthitā samayarājatpā gatarā mādake gavi ।

duraṃhasāṃ sannatā dā sādhyātāpakarāsarā ॥

[स्थिता समयराजत्पा गतरा मादके गवि ।

दुरंहसां सन्नतादा साध्यातापकरासरा ॥ 30-20 ||]

[You protect those who shine in their timely conduct. You are stationed in the Sun. You receive riches. You remove the grief of hard sinners. Your devotees feel intoxicated by your Grace. Your rays render lack of distress possible. You move all around.]

The knight’s tour verse can be read in Fig. 7 by following the cell no.s 1,2,3----32. It is to be noted that if one learns by heart the twin verses one has learnt the knight’s tour. The elegance of this way of coding as compared to the meaningless codes that Someśvara has given [See section. 2 above] is quite striking.

 

Bhoja is another important poet and critic who has given examples of knight’s tour in his book on poetics, “Sarasvatīkaṇṭhābharaṇam” It is seen that Rudraṭa, Bhoja and Vedāntadeśika employ a common knight’s tour whereas Ratnākara employs a different knight’s tour [Fig. 8]


|   | A    | B    | C     | D    | E   | F    | G    | H    |
|---|------|------|-------|------|-----|------|------|------|
| 1 | भा26 | से11  | द्धा24 | हा5  | त20 | त9   | न30  | ना7  |
| 2 | सा23 | दि4  | मा27  | या10 | द29 | से6   | वि19 | ता16 |
| 3 | सा12 | स25  | ह2    | स्त21 | त14 | या17 | शा8  | न्त31 |
| 4 | सा3  | रा22 | हि13  | त28  | स1  | मि32 | द्यु15 | ता18 |

Fig. 8 Ratnakara’s knight’s tour.

The relevant verses of Ratnākara are as follows:

tāmabhyayuṅkta yāsaṅkhyasaṅkhyāvadbhirvṛtā bhaṭaiḥ ।

sūciromṇaḥ camūrnādaiḥ sūcitapralayāgamā ॥ 144 ॥

bhāseddhāhātatananā sādimāyādasevitā ।

sāsahastatayāśāntasārāhitasamidyutā ॥ 145 ||

sahasādihāsenāśā tayāsesāhitadyutā ।

yātā vitrastarāsāddhā sabhāmātadanantasit ॥ 146 ||

[तामभ्ययुङ्क्त यासङ्ख्यसङ्ख्यावद्भिर्वृता भटैः ।

सूचिरोम्णः चमूर्नादैः सूचितप्रलयागमा ॥ १४४ ॥

भासेद्धाहाततनना सादिमायादसेविता ।

सासहस्ततयाशान्तसाराहितसमिद्युता ॥ १४५ ॥

सहसादितसेनाशा तयासेसाहितद्युता ।

याता वित्रस्तरासाद्धा सभामातदनन्तसित् ॥ १४६ ॥ ]

The three verses above form one sentence. The second verse is the main verse and the third verse is the knight’s tour verse. The meaning of the verses is roughly as follows:

Suciroma’s lustrous angry army, which had a fear-less roar, which was served by horsemen and magicians, which had gained advantage by virtue of having swords in hand, which comprised of soldiers protected by the large army, whose sounds indicated the arrival of final annihilation and which attacked Kali, the divine force was defeated by her.

 

It needs to be mentioned that Dr. Knuth was so much fascinated by the knight’s tour verses in Sanskrit that he composed a similar pair of verses in English! Whereas in Sanskrit each cell contains a syllable, in Knuth’s verses each cell contains a word. [Fig. 9 & 10] [[https://www.iiitb.ac.in/CSL/projects/Chitrakavya/visuals.html](https://www.iiitb.ac.in/CSL/projects/Chitrakavya/visuals.html)]




|   | A       | B      | C       | D       | E      | F        | G       | H       |
|---|---------|--------|---------|---------|--------|----------|---------|---------|
| 1 | 26have  | 11some | 24fun   | 5watch  | 20this | 9or      | 30that  | 7word   |
| 2 | 23great | 4four  | 27lines | 10take  | 29out  | 6each    | 19gives | 16eight |
| 3 | 12left  | 25then | 2two    | 21black | 14and  | 17just   | 8here   | 31white |
| 4 | 3three  | 22rook | 13steps | 28make  | 1one   | 32knight | 15move  | 18right |

Fig. 9  Knuth’s  main verse \





|   | A    | B     | C      | D     | E      | F     | G     | H      |
|---|------|-------|--------|-------|--------|-------|-------|--------|
| 1 | one  | two   | three  | four  | watch  | each  | word  | here   |
| 2 | or   | take  | some   | left  | steps  | and   | move  | eight  |
| 3 | just | right | gives  | this  | black  | rook  | great | fun    |
| 4 | then | have  | lines  | make  | out    | that  | white | knight |

Fig. 10  Knuth’s knight’s tour verse.

## 6.0 Rudraṭa’s Verse

 

Having had a look at knight’s tour verse-pairs, let us have a look at Rudraṭa’s composition which has a unique feature. The 15<sup>th</sup> verse of the 5<sup>th</sup> Chapter of his Kāvyālaṅkāra which reads as follows is a knight’s tour verse.

senā līlīlīnā nālī līnānā nānālīlīlī ।

nālīnālīle nālīnā līlīlī nānānānālī || 15 ||

[सेना लीलीलीना नाली लीनाना नानालीलीली ।

नालीनालीले नालीना लीलीली नानानानाली ॥ १५ ॥]

It can be translated as follows:

“I, a truthful well-read man, a leader of a group, helpful to servants, praise the army which has as its leader a man who praises playful persons”.

 

Namisādhu_,_ the commentator, after explaining the meaning of the verse, gives a cryptic mnemonic verse in his commentary which reads as follows:

kaśajhenāgabhaṭāya tathakheveñarāghabe ।

ṣajethāḍhepacemeṭhe doṇasachalaḍephaṅe ॥

[कशझेनागभटाय तथखेवेञराघबे ।

षजेथाढेपचेमेठे दोणसछलडेफङे ॥]

He further says, “Write this verse over_ “senā lī”_ [“सेनाली---“] verse serially each letter over its corresponding letter. Then following the alphabetical order of the letters in the mnemonic verse you can get the knight’s move verse.”

 

The cryptic verse of Namisādhu has no meaning and contains each of the Sanskrit consonants from क(ka) to स(sa) only once. (There is apparently an error in the mnemonic verse, which has occurred while printing or copying manuscript. It reads थ instead of ध and that leads to double occurrence of थ and missing of ध.) Vowels attached to the consonants are just there to meet the constraints of prosody and have no value or meaning.

Following Namisādhu’s explanation, the corrected mnemonic verse has been placed over Rudraṭa’s verse in Fig. 11. For clarity, Rudraṭa’s verse is in Roman script, while Namisādhu’s mnemonic is in Devanāgarī script.  Alphabetical serial number of the letter is also given.




|       |      |       |       |      |       |       |      |
|-------|------|-------|-------|------|-------|-------|------|
| क-1   | श-30 | झे-9   | ना-20 | ग-3  | भ-24  | टा-11 | य-26 |
| se    | nā   | lī    | lī    | lī   | nā    | nā    | lī   |
| त-16  | ध-19 | खे-2   | वे-29  | ञ-10 | रा-27 | घ-4   | बे-२३ |
| lī    | nā   | nā    | nā    | nā   | lī    | lī    | lī   |
| ष-31  | जे-8  | था-17 | ढे-14  | प-21 | चे-6   | मे-25  | ठे-12 |
| nā    | lī   | nā    | lī    | le   | nā    | lī    | nā   |
| दो-18 | ण-15 | स-32  | छ-7   | ल-28 | डे-13  | फ-22  | ङे-5  |
| lī    | lī   | lī    | nā    | nā   | nā    | nā    | lī   |

Fig. 11.  Rudraṭa’s verse and the knight’s tour

If we follow the alphabetical order it clearly gives the knight’s tour, which turns out to be the same as what Vedāntadeśika has used for his verse-pair. [It is very likely that the poets knew the solution through an earlier knight’s tour verse-pair or a mnemonic verse, same as or similar to, the one given by Namisādhu_._]

Rudraṭa_ _ has simplified the complexity of composition by adopting only 4 syllables. His composition is unique as his knight’s tour verse is the same as the main verse.

It is natural to investigate if his use of only 4 distinct syllables is connected with the knight’s tour sequence yielding the same verse. It indeed turns out that in order that the knight’s tour sequence yield the same verse, there cannot be more than 4 distinct syllables in the verse.

To prove this, we set up a table of equality (Fig. 12) where the 2 serial cell-numbers in a column have to be the same syllable:



|                              |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |
|------------------------------|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|
| Main verse cell No.          | 1  | 2  | 3  | 4  | 5  | 6  | 7  | 8  | 9  | 10 | 11 | 12 | 13 | 14 | 15 | 16 |
| Knight’s tour verse cell No. | 1  | 11 | 5  | 15 | 32 | 22 | 28 | 18 | 3  | 13 | 7  | 24 | 30 | 20 | 26 | 9  |
|                              |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |
| Main verse cell No.          | 17 | 18 | 19 | 20 | 21 | 22 | 23 | 24 | 25 | 26 | 27 | 28 | 29 | 30 | 31 | 32 |
| Knight’s tour verse cell No. | 19 | 25 | 10 | 4  | 21 | 31 | 16 | 6  | 23 | 8  | 14 | 29 | 12 | 2  | 17 | 27 |

Fig. 12.  Table of equality of cells to ensure that Rudraṭa’s main verse and knight’s tour verse are same


This table of equality leads to the interesting result that

the following cells have to have the same syllable:

2,11,7,28,29,12,24,6,22,31,17,19,10,13,30.

The following cells have to have the same syllable:

3,5,32,27,14,20,4,15,26,8,18,25,23,16,9,

These two sets of cells turn out to be the two disjoint cycles of the knight’s tour permutation. Cell no.1 and Cell No.21 can have distinct syllables.

Rudraṭa’s verse adheres to the above criteria where cell No.1 contains syllable से ‘se’, cell No.2, 11 etc contain syllable  ना  ‘nā_’_, cell No.3,5 etc contain syllable ली ‘lī_‘ _and cell no.21 contains syllable ले ‘le’. It may be noted that the syllable in cell 21 of the main verse is also the syllable in cell 21 of the knight’s tour verse.

Now a question arises. Let us suppose that instead of Rudraṭa’s knight’s tour we are interested in composing a verse based on any of the other knight’s tours we have had a look at. Then, what are the conditions that will need to be satisfied, if we want to ensure that the verse read along knight’s tour is the same as the main verse? The answer can be worked out in the same manner as was worked out in the case of Rudraṭa’s verse.

It would however be appropriate to have a look at this procedure at an elementary level as follows. Supposing we permute a set of elements (a,b,c,d,e,f) as follows:

a->b->c->a; d->e->d; f->f.

This permutation can be written as (abc)(de)(f). The various alternatives can be listed as

abc de f, bca ed f, cab de f, abc ed f, bca de f, cab ed f,

The number of distinct alternatives is 6, LCM of the periods of the two cyclic permutations. If we say that the elements of the set are such that this permutation leaves the order of the elements of the set unchanged, it implies a=b=c; d=e. That means there can only be 3 independant elements, one for each disjoint cycle.

This logic is clearly extendable to the case of Rudraṭa’s knight’s tour verse. In the case of the latter, the knight’s tour verse coincides with the main verse. When we set up the set of equations to enforce this coincidence, the disjoint cycles separate out automatically and we are led to the result that all the elements of a disjoint cycle will have to be a common syllable. In case of Rudraṭa’s knight’s tour as there are 2 disjoint cycles each having 15 elements and 2 fixed points there can be a maximum of 4 syllables only. Similarly for knight’s tours of Ratnākara, Someśvara and Euler, the maximum number of syllables that the verse can have in order that the knight’s tour verse be the same as main verse can be worked out and the details are as per Fig. 13.

| A Verse-pair of | B No.of syllables | C Syllable No. | D Cell No.s where the syllable has to appear (Also indicates the permutation structure:Fixed points and cyclic permutations)                             |
|-----------------|-------------------|----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Rudraṭa (4x8)   | 4                 | 1              | Cell No. 1                                                                                                                                               |
|                 |                   | 2              | Cell No. 21                                                                                                                                              |
|                 |                   | 3              | Cells (2,11,7,28,29,12,24,6,22,31,17,19,10,13,30.) 15 cells                                                                                              |
|                 |                   | 4              | Cells No. (3,5,32,27,14,20,4,15,26,8,18,25,23,16,9) 15 cells                                                                                             |
| Ratnakara (4x8) | 3                 | 1              | Cell No. 16                                                                                                                                              |
|                 |                   | 2              | Cell No. 28                                                                                                                                              |
|                 |                   | 3              | Cells No. (1,29,13,27,11,2,19,15,31,24,3,25,18,32,30, 7,8,23,9,6,14,21,20,5,4,10,12,17,22,26) 30 cells                                                   |
| Someśvara (8x8) | 4                 | 1              | Cell No. 11                                                                                                                                              |
|                 |                   | 2              | Cell No. 26                                                                                                                                              |
|                 |                   | 3              | Cells No.(57,29,52,37,6,23,13,18,64,46,48,21,15, 50,44,53,43,59,4,55,45,63,36,16,60,10,5,40,17, 54,28,58,19,47,31,56,35,22,30,62,42,49,38,12,1) 45 cells |
|                 |                   | 4              | Cells No. (3,61,25,9,20,32,39,2,51,27,41,34,7,8,14,33,24) 17 cells                                                                                       |
| Euler 4x8       | 3                 | 1              | Cell No. 1                                                                                                                                               |
|                 |                   | 2              | Cell No. 23                                                                                                                                              |

Fig. 13. Required number of syllables and their cell no.s for the knight’s tour verse to be the same as main verse (4 different tours).

Fig. 13 shows that among three 4x8 knight’s tours studied, Ratnakara’s and Euler’s require 3 syllables. Someśvara’s 8x8 knight’s tour will need a pair of main verses, each verse having 32 syllables and it will require 4 syllables.


Fig. 13 (Column D) also indicates the structure of permutation in each of the four knight’s tours. Rudraṭa’s knight’s tour is a permutation of the elements of set 1,2,3,----32 which maps the 15 elements of subset ( 2,11,7,28,29,12,24,6,22,31,17,19,10,13,30) to each other in a cyclic fashion and 15 elements of subset (3,5,32,27,14,20,4,15,26,8,18,25,23,16,9) to each other in a cyclic fashion, while elements 1 and 21 remain fixed. Similar statements can be made in respect of the other three knight’s tours. It is interesting and intriguing too, to note that there are two and only two fixed points in each of the four knight’s tours studied.

## 7.0 Conclusion

Solution to the knight’s tour problem was known in India as early as the 9<sup>th</sup> century AD in the form of a literary skill, where a  32-syllable verse written on a 8x4 chess-board yields another meaningful verse if read as per the movement of a knight visiting all the 32-cells one and once only. Rudraṭa’’s Kāvyālaṅkāra_ _ provides a verse employing only 4 distinct syllables where the knight’s tour yields the same verse. This article, first gives an introduction to knight’s tour as a chess puzzle, as a mathematical problem and as demonstrator of wizardry in Sanskrit versification and then works out the maximum number of distinct  syllables that the verses could contain in order that the knight’s tour verse be the same as the main verse, in respect of four different knight’s tours. It is seen that only in respect of Rudraṭa’s knight’s tour  a maximum of 4 distinct syllables could be accommodated. The article also indicates the cyclic permutation associated with each of the four knight’s tours.

## 8.0 Suggested Reading

Books

[1] Śivaśekhara  Miśra: Mānasollās ek sāṃskṛtik adhyayan : Caukhambā vidyā bhavan Vārāṇasī 1966 (Hindī)

[2] Rāma rūpa Pāṭhak : Citrakāvyakautukam : Motīlāl banārasī dās Delhi (Sanskrit)

[3] H.J.R. Murray: A history of chess : Clarendon Press, Oxford

[4] G K Srigondekar: Manasollasa of King Someswara : Baroda Oriental Institute (Sanskrit)

[5] Pt. Durgaprasad and Panduranga Parab: Kiratarjuniya of Bharavi: Nirnayasagar Press, Mumbai ( Sanskrit)

[6] Pt. Durgaprasad and Panduranga Parab: Haravijayam of Rajanaka Ratnakara: Nirnayasagar Press: Mumbai ( Sanskrit )

[7] Pt. Kedaranatha and W L S Panashikar: Padukasahasra od Sri Venkatanatha Deshika: Nirnayasagar Press, Mumbai ( Sanskrit )

[8]  Kavyamala Series: : Kavyalankara of  Rudrata:; Nirnayasagar Press: Mumbai ( Sanskrit )

[9] Pt. Kedaranatha Sarma and Vasudeva Sarma: Sarasvatikanthabharanam of Sri Bhojadeva: Chaukhambha Orientalia: Varanasi (Sanskrit)

### Web sites



1. [https://plus.maths.org/content/knights-tour](https://plus.maths.org/content/knights-tour)
2. [http://eulerarchive.maa.org/](http://eulerarchive.maa.org/)
3. [http://www-history.mcs.st-and.ac.uk/Projects/MacQuarrie/Chapters/Ch3.html](http://www-history.mcs.st-and.ac.uk/Projects/MacQuarrie/Chapters/Ch3.html)
4. [https://www.researchgate.net/publication/265424016_Knight's_tours_for_cubes_and_boxes](https://www.researchgate.net/publication/265424016_Knight's_tours_for_cubes_and_boxes)
5. [https://en.wikipedia.org/wiki/Knight%27s_tour#Warnsdorff's_rule](https://en.wikipedia.org/wiki/Knight%27s_tour#Warnsdorff's_rule)
6. [https://www.youtube.com/watch?v=C95hHI7cVNs](https://www.youtube.com/watch?v=C95hHI7cVNs)
7. [https://www.iiitb.ac.in/CSL/projects/Chitrakavya/visuals.html](https://www.iiitb.ac.in/CSL/projects/Chitrakavya/visuals.html)



## Notes

[^1]: Movements ascribed to the chariot (ratha) and elephant (gaja) in Mānasollāsaḥ are at variance with the movements prescribed to rook and bishop in modern chess.

[^2]: euphonic coalition causing modifications of the final letters of a word and the beginning letters of the next word in a sentence.

[^3]: Construction of compound words

[^4]: Dr S. Rajaraman has been presented with Vyas samman (2019) by The Government of India for his accomplishments in the genre of Citrakāvyam.
