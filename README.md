# R Shims

Inspired by a need to synchonize minor versions of R (`x.y`, e.g. `4.0` in `4.0.3`) across projects. Puts shims for `R`, `Rscript`, and `rstudio` utilities on the `PATH` after manual edition to dot-profile.  

Does **not** handle installing R. 

Some conversation for handling the use of different versions of R stemmed from below issue:
- https://github.com/rstudio/renv/issues/254

Some other projects that handle this:
- [renv / renv-installer](https://github.com/jcrodriguez1989/renv-installer) utility (not R package), which stems from [pyenv](https://github.com/pyenv/pyenv)
- [RSwitch](https://rud.is/rswitch/) for macOS - GUI and CLI utility

Currently, only supporting regular Mac binary CRAN `.pkg` installs. Simple and effective. Not as complex as aforementioned projects.

When implemented, Mac & Windows will be supported on separate branches.

# Download / Install

## Mac

`git clone --single-branch --branch mac https://github.com/prncevince/r-shims $HOME/.R/shims`

Use `git pull` in your `$HOME/.R/shims` directory to update as needed.

Add to your Bash/Zsh dot profile:

```bash
export PATH="$HOME/.R/shims:$PATH"
```

For each version of R that you have installed, edit the `/Library/Frameworks/R.framework/Versions/x.y/Resources/bin/R` shell file. Comment out lines 29 to 34 like so:

```sh
#if test -n "${R_HOME}" && \
#  test "${R_HOME}" != "${R_HOME_DIR}"; then
#  echo "WARNING: ignoring environment value of R_HOME"
#fi
#R_HOME="${R_HOME_DIR}"
```

# Usage

Create a `.Rversion` file containing the minor version of R (`x.y`) in the root of your repo. 

- e.g. `echo 4.0 > .Rversion`

`cd` to the repo's root directory. 

To open RStudio with the specified version of R, and inside a `*.Rproj` if also in the repo, simply run:

`rstudio`

To just run the specified version of R, use `R` or `Rscript` in the usual way.

# Why shims?

Programs that utilize R (e.g. [GNU Make](https://www.gnu.org/software/make/)), access the current shells `PATH` environment variable, but not aliases/functions. Thus, shims are necessary for programs like GNU Make to use the updated `R`/`Rscript` utilities.

In addition, they don't plague your dot-profile with functions/aliases. There are many other reasons as well. 
