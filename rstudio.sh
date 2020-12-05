rpath=/Library/Frameworks/R.framework/Versions
old=$(readlink "$rpath"/Current); 
if [ -f .Rversion ]; then 
  new=$(cat .Rversion)
  if [[ $(/bin/ls "$rpath" | grep "$new") == "" ]]; then 
    echo "R version" "$new" "not installed" && return 1; else
    ln -sfh "$new" "$rpath"/Current; fi; fi
if [ -n "$ZSH_VERSION" ]; then unsetopt local_options nomatch; fi
if [ -f *.Rproj ]; then 
  open -na Rstudio *.Rproj; else 
  ("/Applications/RStudio.app/Contents/MacOS/RStudio" &)
fi; ({ sleep 5; ln -sfh "$old" "$rpath"/Current;} &)
