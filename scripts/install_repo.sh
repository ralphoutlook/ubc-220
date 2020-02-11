#!/bin/bash

script=$(realpath ${BASH_SOURCE[0]})
currdir=$(dirname $script)
repodir=$currdir/bin

cat << EOF
########################################################
  script : $script
  currdir : $currdir
########################################################
EOF

chkrepodirinpath(){
  echo $PATH | grep -q "${repodir}" 2>/dev/null
  echo $?
}

setreporpath(){
  if [ "$(chkrepodirinpath)" -eq  1 ]; then 
    echo "set repo path!!"
    PATH=${repodir}:$PATH
  else
    echo "repo path already exists!!"
  fi
}

getrepo(){
  mkdir -p $repodir
  [ ! -f "$repodir/repo" ] && curl -s http://commondatastorage.googleapis.com/git-repo-downloads/repo > $repodir/repo
  chmod a+x $repodir/repo
}

unsetenv(){
  unset script currdir repodir
}

#chkrepodirinpath
getrepo
setreporpath
unsetenv

