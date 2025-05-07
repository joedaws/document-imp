# Document Imp

A CLI tool for creating document to facilitate a note taking workflow. 

This tool is to help making a second brain note system without being
restricted to the editor. The spawing and connectivity of notes 
are developed overtime with the tool. The editing and refinement of
notes is performed with whatever tool the user likes most for editing.
Editors are great for editing text and sometimes less great for
creating files and getting templates into files. Although vim,
neovim, ecmacs, and the like can all create documents from templates
you have to learn the specific scripting language or use someone
else's framework.

## Prerequisites

Install [GHCup](https://www.haskell.org/ghcup/)

## Install

Clone the repository locally and use stack to install the executable
into your path

```bash
stack install
```

## Usage

### Create basic note

```bash
dimp note CLIs are fun
```
which will create the markdown file `CLIs-are-fun.md` in the current
directory.
