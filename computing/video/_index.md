+++
title = "+Video"
+++



## Players and Transcoders
<div class="spreadsheet" src="player_transcoder.toml" fullHeightWithRowsPerScreen=8> </div>  

### VLC
Ctrl P for preferences. 

#### Video Lags
Sometimes the video lags.

- VLC can do video decoding in the GPU - but data transfer slows down. Disable hardware decoding.
- Increase file caching to 8000ms


#### Audio lag
- Keys K and J to adjust sync.

### ffmpeg
- For a 97 min film (7GB flv)
  - 600MB, a bit blurry with -crf 35.0 -vcodec libx264 -acodec aac -b:a 128k -coder 1 -flags +loop -cmp +chroma -partitions +parti4x4+partp8x8+partb8x8 -me_method hex -subq 6 -me_range 16 -g 250 -keyint_min 25 -sc_threshold 40 -i_qfactor 0.71 -b_strategy 1 -strict -2
  - 2GB with -crf 25.0 -vcodec libx264 -acodec aac -b:a 160k -coder 1 -flags +loop -cmp +chroma -partitions +parti4x4+partp8x8+partb8x8 -me_method hex -subq 6 -me_range 16 -g 250 -keyint_min 25 -sc_threshold 40 -i_qfactor 0.71 -b_strategy 1 -strict -2


## Recorders
<div class="spreadsheet" src="recorder.toml" fullHeightWithRowsPerScreen=8> </div>  

## Editors
<div class="spreadsheet" src="editor.toml" fullHeightWithRowsPerScreen=8> </div>  

### Kdenlive
- `Shift R` for cutting

