+++
title = "+Version Control"
+++

## git
<div class="spreadsheet" src="../git.toml" fullHeightWithRowsPerScreen=8> </div>  

### Splitting subdir to differnt branch and including it
```
git subtree split --prefix=subdir_path -b some_branch
git push origin some_branch
git rm -rf subdir_path
git submodule add -b some_branch -f https://github.com/XYZ/UVW subdir_path
```

## Sonatype
- They provide infrastructure to publish open source libraries to Maven
- staging repositories
  - manage on web - https://oss.sonatype.org/#stagingRepositories
  - In case of trouble, simplest to drop repository.