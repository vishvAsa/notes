+++
title = "Hugo"
+++

## Intro
- Static site gengerator - converts markdown files (with yaml or toml metadata) placed in a certain directory structure to html. 
- much faster than jekyll.


## File Organization
### High level structure
- content
- data
- layouts - (overrides themes/THEME_DIR/layouts)
  - _default
  - partials  (headers, footers etc.. to be included in other htmls)
  - someContentType
- static 
- themes
- config.toml

### Content types
- Single page
- List
  - A list page template is a template used to render multiple pieces of content in a single HTML page.
  - Taxonomy terms pages
  - Taxonomy list pages
  - Section list pages (Corresponding to _index.md of the section as well)
  - RSS

### Content Sections
- The below are sections
  - Any directory which is directly under content directory.
  - Anything with an _index.md file.

## Template selection
### Selection steps
- Select based template
- Select final template to override blocks in base template.

### Criteria
- Based on Kind
  - Base - _default/baseof.html
  - Default single page - _default/single.html
  - Default list page template (overrides certain blocks of base templates) - _default/list.html
- Based on Layout
  - Can be set in page frontmatter
- Based on output format
- Based on (Root) Type
  - value of type if set in front matter, else it is the name of the root section (e.g. “blog”). It will always have a value, so if not set, the value is “page”.
- Based on Sections
  - When we talk about a section in correlation with template selection, it is currently always the root section only (/blog/funny-cats/mypost/ => blog). If you need a specific template for a sub-section, you need to adjust either the type or layout in front matter.

### Lookup order
- Single page in "posts" section
  - layouts/posts/single.html.html
  - layouts/posts/single.html
  - layouts/_default/single.html.html
  - layouts/_default/single.html
- Single page in "posts" section with layout set
  - layouts/posts/demolayout.html.html
  - layouts/posts/single.html.html
  - layouts/posts/demolayout.html
  - layouts/posts/single.html
  - layouts/_default/demolayout.html.html
  - layouts/_default/single.html.html
  - layouts/_default/demolayout.html
  - layouts/_default/single.html
- Base template for single page in "posts" section with layout set
  - layouts/posts/demolayout-baseof.html.html
  - layouts/posts/single-baseof.html.html
  - layouts/posts/baseof.html.html
  - layouts/posts/demolayout-baseof.html
  - layouts/posts/single-baseof.html
  - layouts/posts/baseof.html
  - layouts/_default/demolayout-baseof.html.html
  - layouts/_default/single-baseof.html.html
  - layouts/_default/baseof.html.html
  - layouts/_default/demolayout-baseof.html
  - layouts/_default/single-baseof.html
  - layouts/_default/baseof.html


## Setup
- Create a config.toml. See this site for example.

## Taxonomy listing pages
In config.toml - 

```
[taxonomies]
  category = "categories"
  tag = "tags"
  sutra = "sutras"
```

## Template language
<div class="spreadsheet" src="../hugo-template-language.toml" fullHeightWithRowsPerScreen=8> </div>  

