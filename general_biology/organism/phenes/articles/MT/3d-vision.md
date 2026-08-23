+++
title = "3d vision"
+++

Source: [TW](https://x.com/blog_supplement/status/2091229185461117174)

**Overview**  
While depth perception in vertebrates relies on binocular disparity, invertebrates have evolved radically distinct hardware and computational mechanisms to achieve precise 3D localization under tight neurological constraints.

## Primary 3D Mechanism

### Jumping Spider (Salticidae)
Monocular Defocus  
Image Defocus (Depth-from-Defocus / Spectral Aberration)

### Praying Mantis (Mantodea)
Motion Disparity  
Motion-Luminance Stereopsis (Dynamic Disparity)

### Vertebrates (e.g., reptiles, mammals)
Binocular Disparity  
Static Luminance Stereopsis (Pattern Disparity)

## Optical Hardware

### Jumping Spider (Salticidae)
Monocular & Layered: Single fixed lenses positioned over 4-tiered retinas within principal eyes.

### Praying Mantis (Mantodea)
Binocular: Two wide-set compound eyes mounted on a highly mobile triangular head.

### Vertebrates (e.g., reptiles, mammals)
Binocular: Two camera-style eyes with large overlapping visual fields.

## Core Computation

### Jumping Spider (Salticidae)
Compares a sharp, in-focus image on layer 1 against a blurred image on a deeper retinal layer.

### Praying Mantis (Mantodea)
Compares local shifts in light intensity and movement over time between left and right eye inputs.

### Vertebrates (e.g., reptiles, mammals)
Matches static visual patterns, textures, and fine structural details between left and right retinal views.

## Stationary Object Depth

### Jumping Spider (Salticidae)
High: Accurately measures distance to completely motionless prey prior to pouncing.

### Praying Mantis (Mantodea)
Poor: Blind to depth on static targets; requires prey or head motion to trigger 3D perception.

### Vertebrates (e.g., reptiles, mammals)
High: Constructs detailed 3D depth maps for both moving and still objects/environments.

## Eye Movement Requirement

### Jumping Spider (Salticidae)
Moves internal retinal tubes dynamically behind fixed outer lenses to scan targets.

### Praying Mantis (Mantodea)
Uses head rotations or relies on target movement to generate optical shifts across compound facets.

### Vertebrates (e.g., reptiles, mammals)
Uses external ocular muscles for vergence and tracking to align binocular fields.

## Neural Processing Load

### Jumping Spider (Salticidae)
Extremely Low: Handled by minimal neural hardware using direct optical blur calculations.

### Praying Mantis (Mantodea)
Very Low: Processed within ~1 million neurons focused strictly on motion vectors.

### Vertebrates (e.g., reptiles, mammals)
High: Requires heavy processing power across complex visual cortex networks (e.g., V1, V2).