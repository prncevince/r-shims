rpath=/Library/Frameworks/R.framework/Versions
old=$(readlink "$rpath"/Current); 
if [ -f .Rversion ]; then
  new=$(cat .Rversion)
  if [[ $(/bin/ls "$rpath" | grep "$new") == "" ]]; then 
    echo "R version" "$new" "not installed" && return 1; else
    ln -sfh "$new" "$rpath"/Current; fi; fi
if [ -n "$ZSH_VERSION" ]; then setopt local_options no_monitor; fi
if [ -n "$BASH_VERSION" ]; then set +m; fi; 
({ sleep 2; ln -sfh "$old" "$rpath"/Current; if [ -n "$BASH_VERSION" ]; then set -m; fi } &)
/usr/local/bin/R "$@" 
