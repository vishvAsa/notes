+++
title = "pANDeya on yajnadeva attempt"
+++

Source: [TW](https://x.com/khoomeik/status/1882058141145403817)

Deciphering the Indus Valley script would revolutionize our understanding of Indian history. Recently, @yajnadevam's Sanskrit hypothesis has gained steam & many asked me: is it legit?

So I spent the last couple hours analyzing his decipherment with o3, and here's what I found 🧵

For background, his scheme is a straightforward mapping from IVC symbols to Sanskrit sounds, but note that it ignores:

- aspiration (k vs kh)
- retroflection (त vs ट)
- sibilant place of articulation (स vs श vs ष)

These differences are critical in Sanskrit (especially Vedic). But let's ignore that and look at some translations. Those familiar with Sanskrit upon reading these will note 2 things:

1) Many words are rare, awkward synonyms (let's ignore this issue too)
2) It doesn't "sound" like Sanskrit, despite seeming so to the unfamiliar ear

So how can we quantify that difference in "sound" between Sanskrit & IVC translations ("IVT" hereon)?

I plotted the frequency of each akṣara in the Ṛgveda & in the IVT on a varṇamālā side by side. See how the Ṛgveda has more diverse vowels, and more frequent ग, फ, त, ष, etc? But maybe that variance is normal between Sanskrit texts?

To investigate, I computed the ratio between IVT & Ṛgveda's akṣara frequencies. If the ratio is high for an akṣara, IVT uses it way more than Ṛgveda. If 2 documents are the same language, we expect these ratios ~=1. Red means IVT underuses a sound compared to Ṛgveda, blue means overuses, and whiteish means it has ~same frequency. I did the same for the Śatapatha Brāhmaṇa on the right. 

While ŚB has its phonetic quirks, the ratios mostly ~=1! IVT however has wildly varying akṣara ratios. You contest, "But the Ṛgveda is just one text out of many Sanskrit texts IVT could be similar to! How can we compare IVT's akṣara frequencies to all those other texts to find the ones IVT might resemble?"

Good idea! But first I'll have to briefly teach you about KL Divergence. Given a reference Sanskrit text (P), we want to see how well IVT (Q) approximates it. So for each akṣara (x), we compute the frequency ratio (P(x) / Q(x)) and take its log. We then take the weighted sum across akṣaras based on how frequent the reference text P says each x is. Intuitively, the KL Div from Ṛgveda to IVT is low if IVT doesn't assign low probability to common akṣaras in the Ṛgveda.

When we plot D_KL between IVT, Sanskrit texts, and English texts, we find Sanskrit & English each form "clusters". But IVT stands on Sanskrit's fringe. While IVT has lower D_KL with Sanskrit ~0.7 than with English ~3.5, this is expected of a Sanskrit translation attempt. Virtually all other Sanskrit texts have mutual D_KL ~<0.05.

IVT is not Sanskrit, but it's better at modeling Sanskrit than Lorem Ipsum is at modeling English. As I explained in my caṣāla thread, the IVC clearly practiced Vedic culture. However, as a result of these investigations, I must reject @yajnadevam's hypothesis.

I hope this makes us all thirsty once again for a true decipherment. It could be you. 🫡🙏

