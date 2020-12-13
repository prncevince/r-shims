rpath=/Library/Frameworks/R.framework/Versions
if [ -f .Rversion ]; then
  ver=$(cat .Rversion)
  if [[ $(/bin/ls "$rpath" | grep "$ver") == "" ]]; then
    echo "R version" "$ver" "not installed" && return 1; else
    export R_HOME="$rpath"/"$ver"/Resources; fi; fi
"$R_HOME"/Rscript "$@"
