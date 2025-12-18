+++
title = "+Version Control"
+++

## jj
> jj is the best DVCS I have used in the last 20 years. This includes subversion, mercurial, fossil and git  -- kArtik


`jj git init --colocate` in your git repo.

## git
<div class="spreadsheet" src="../git.toml" fullHeightWithRowsPerScreen=8> </div>  

<details><summary>Common tasks</summary>

```
git submodule add --depth 1 https://github.com/sanskrit-coders/sanskrit-documentation-theme-hugo themes/sanskrit-documentation-theme-hugo
```

</details>


### Remember credentials
`git config --global credential.helper store` avoids needing to retype credentials each time.

#### Default user
- In linux, ensure that `~/.git-credentials` have the keys in the right order - the earlier key will be tried first.

### Splitting subdir to differnt branch and including it
```
git subtree split --prefix=content -b some_branch
git push origin some_branch
git rm -rf subdir_path
git submodule add -b some_branch -f https://github.com/XYZ/UVW subdir_path
```

<details><summary>विस्तारः (द्रष्टुं नोद्यम्)</summary>

git subtree split --prefix=content -b content
git push origin content
git rm -rf content
git submodule add -b content -f https://github.com/vishvAsa/gItam_vaiShNavam content
</details>


### Large pushes

```
git config --global http.version HTTP/1.1
```

### Drop history
Just do a shallow clone (`git clone --depth 10`) and force push `git push -f`.

Rebasing can go haywire - requiring merge conflict fixes.

## Sonatype
- They provide infrastructure to publish open source libraries to Maven
- staging repositories
  - manage on web - https://oss.sonatype.org/#stagingRepositories
  - In case of trouble, simplest to drop repository.