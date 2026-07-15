+++
title = "Scanner"
+++

## Android Phone
- VFlat
- Adobe scanner
- Camscanner

## IPEVO v4k
- IPEVO V4K Ultra High Definition 8MP
  - [Amazon](https://www.amazon.in/gp/product/B079DLTG9F/ref=ppx_od_dt_b_asin_title_s00?ie=UTF8&psc=1)

### Usage
- Bought 15 Nov 2021. Taiwanese. Spent about 16k INR. Used rarely.
- Hardware
  - A good and sturdy stand for the 4k camera. No LED light.
  - There is an embedded mike (Speaking distance - 11.8" to 27.6"). An LED indicator - shows if the feed is on.
  - Buttons
    - Auto-Focus 
      - Press once to focus.
    - Auto-Focus mode button
      - AutoFocus-Single (AF-S) or AutoFocus-Continuous (AF-C).
      - Press again without holding to change the focus mode back to AF-C.
    - Exposure duration, 
- Software
  - Doesn't work well with scanner software on Arch Linux + Cinnamon.
  - Best option seems to be to use the IPEVO Visualizer ([Downloads](https://www.ipevo.com/software/visualizer#releaseNote6))
    - browser app [here](https://apps.ipevo.com/pwa/visualizer.app/)
    - chrome app works  - but is set to be retired as of 2022
    - Extracting and running the jar program from the Ubuntu package failed
      - with an exception as of 20220812. ("UnsatisfiedLinkError: /tmp/nativeutils132733616685487/libHelloJni.so: libuvc.so.0".)
      - `yay -S libuvc` produced `/usr/lib/libuvc.so`, but that did not resolve the problem.
  
- Book scanning 
  - With 8.5 x 5.5 Inch page book with regular devanAgarI print, quality was ok for single page mode. Not quite sufficient for two page mode. So, would need to scan even pages and odd pages separately - and then combine (easy with "PDF Arranger" on Arch Linux ).

<details><summary>IPEVO Visualizer problems</summary>

Reported on their website -

I am trying to scan a book. I have the following problems:

- If I set the vertical keystone, the camera button (at the bottom in https://i.imgur.com/1XpsOxM.jpg ) is disabled. Please fix the software so that this does not happen.
- There ought to be a crop option, so that each time I turn a page and take a picture, the same crop and keystone are applied. Can you please fix the Visualizer to enable this?
- Once I change the resolution, I cannot change it again without restarting the software - see image https://i.imgur.com/Jlu2wnV.jpg . Can this be fixed, please?
</details>



### Off-use 
- Often, it gets used instead of the webcam - so need to disconnect it.
