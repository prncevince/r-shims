# R Shims

Inspired by a need to synchonize minor versions of R (`x.y`, e.g. `4.0` in `4.0.3`) across projects. Conversation stemmed from below issue:
- https://github.com/rstudio/renv/issues/254

Does **not** handle installing R. 

# Download / Install

## Mac

`git clone https://github.com/prncevince/r-shims $HOME/.R/shims`

Add to your Bash/Zsh dot profile:

```bash
export PATH="$HOME/.R/shims:$PATH"
```

# Usage

Create a `.Rversion` file containing the minor version of R (`x.y`) in the root of your repo. 

- e.g. `echo 4.0 > .Rversion`

`cd` to the repo's root directory. To open RStudio with the specified version of R, and inside a *.Rproj if also in the repo simply run:

`rstudio`

To just run the specified version of R, use `R` or `RScript` in the usual way.

# Why shims?

Programs that utilize R (e.g. GNU Make), access the current shells `PATH` environment variable, but not aliases/functions. Thus, shims are necessary for programs like GNU make to use the updated `R`/`Rscript` and homemade `rstudio` utilities.

