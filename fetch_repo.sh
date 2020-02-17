#!/bin/bash

script=$(realpath ${BASH_SOURCE[0]})
currdir=$(dirname $script)
builddir=$currdir/build
repodir=$builddir/bin
repover=v1.13.9.4
repogiturl=https://gerrit.googlesource.com/git-repo

fetch_repo(){
  mkdir -p $repodir
  git clone --depth=1 --branch $repover $repogiturl $repodir && rm -rf $repodir/.git && touch $builddir/.fetch_repo
}

[ ! -f "$builddir/.fetch_repo" ] && fetch_repo

