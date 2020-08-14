+++
title = "Latex"
+++

Both declarative (rule-based) and imperative specification of document display is possible.

A document element is defined to either be a command and or an environment - which are distinguished based on the input they accept.

## Common commands, environments
Common commands include section, subsection, paragraph, subsubsection, title, author. Common environments include list (itemize and enumerate), tabular etc..

### Templates
Rules which map commands and environments to imperative display rules are collected together in templates. These rules may be overriden. Every document must be based on some template.

Common templates include: report, article.

### Packages
Often display rules may be redefined in files called packages, which may be used/ invoked using usepackage command.

#### Page setup
microtype for full justification of text. fullpage for using the maximum possible printable area.

#### List compaction
enumitem and shortlst make lists more configurable.

## Bibliography
This part of the document is often dynamically generated based on citations used and a bibliography file. In this process, aux and bbl files are generated and used. \exclaim{In case of error, try deleting these files!}

Two things affect document display here: citation style and bibliographystyle. These are usually specified using packages, possibly followed by minor redefinitions of commands.

### Packages
natbib is configurable and popular.

## (Re)definition
Commands can be defined using: \verb'\newcommand{cmd}[args]{def}'.

Environments can be defined using \verb'\newenvironment{env}[args][default]{begdef}{enddef}'.

Older definitions can be overridden using renewcommand and renewenvironment.

## Imperative display commands
textit, textbf.

center, raggedleft, raggedright.

### Font size
In order:     tiny
    scriptsize
    footnotesize
    small
    normalsize
    large
    Large
    LARGE
    huge
    Huge .

Using them resets the font size till the end of the current text block.

### Display parameters
They can be set using addtolength and setlength commands.

Common parameters include textwidth, oddsidemargin, evensidemargin, topsidemargin, parskip.

One can define colors using: \verb'\definecolor{mygrey}{gray}{.95}'.

### Space management
\verb'\vspace{-3ex}' sets the vertical spacing to a third the size of 'x'. This should ideally be used towards the end of the document.

hfill and vfill are used to fill spaces.

## Drawing figures
pstricks. tikz: good for drawing graphs with nodes and edges, but not as advanced as pstricks.
