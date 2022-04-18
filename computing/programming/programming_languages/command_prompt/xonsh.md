+++
title = "Xonsh"
+++

## File wild cards
```
>>> p`.*`
[Path('foo'), Path('bar')]


`re`, r`re`
>>> ls `a(a+|b+)a`
aaa  aba  abba
```

## Iterate over files
### Find text
```
import regex
for fpath in pg`**/*.md`:
    if not fpath.is_file():
        continue
    try:
      matches = regex.findall("म्([चछजझञ])", fpath.read_text())
      if len(matches) > 0:
        print("%s - %s" % (fpath, len(matches)))
    except:
      print("Error with %s", fpath)
```


### Replace text
```
import regex
for fpath in pg`**/*.md`:
    if not fpath.is_file():
        continue
    try:
      pattern = r"म्([चछजझञ])"
      ftext = fpath.read_text()
      matches = regex.findall(pattern, ftext)
      if len(matches) > 0:
        print("%s - %s" % (fpath, len(matches)))
        fpath.write_text(regex.sub(pattern, r"ञ्\1", ftext))
    except:
      print("Error with %s", fpath)
```

### Run commands
```python
for fn in $(ls).split():
     bzip2 @(fn)
```

```
for fpath in pg`*`:
    if not fpath.is_dir():
        continue
    print(fpath)
    cd @(fpath)
    git config user.email vishvas.vasuki@gmail.com
    git config user.name vvasuki
    cd ..
```


## Misc reference
<div class="spreadsheet" src="../xonsh.toml" fullHeightWithRowsPerScreen=8> </div>  

