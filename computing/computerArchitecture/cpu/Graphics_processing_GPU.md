+++
title = "Graphics processing (GPU)"

+++
GPU's, implementing common graphics tasks on specialized circuits, speed up display tasks involved in personal computing.

## High data parallelism
GPU's follow a dataflow architecture: Highly pipelined, parallel with many small cores - much more than CPU's. Usually, these parallel cores are divided profitably and easily: Like one core for a bunch of pixels.

Earlier these processing elements were specialized for graphics, now these shaders are more programmable.

## For general computing
With GPGPU, one would Disguise program as geometry computation. Now, can do such computation directly: eg: NVidia CUDA.