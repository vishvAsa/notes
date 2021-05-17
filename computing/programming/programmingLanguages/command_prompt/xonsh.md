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
### Replace text
```
for fpath in pg`**baz*`:
    if not fpath.is_file():
        continue
    fpath.write_text(fpath.read_text().replace('foo', 'bar'))
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

