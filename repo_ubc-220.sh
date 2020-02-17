#!/bin/bash

script=$(realpath ${BASH_SOURCE[0]})
currdir=$(dirname $script)
builddir=$currdir/build
repodir=$builddir/bin
repover=v1.13.9.4
repogiturl=https://gerrit.googlesource.com/git-repo
yoctodir=$builddir/yocto
yoctourl=git://github.com/ADVANTECH-Corp/adv-arm-yocto-bsp.git
#yoctobranch=refs/tags/imx6LBV8040
yoctobranch=refs/tags/imx6LBV8A00
#yoctomanifest=imx6LBV8040.xml
yoctomanifest=imx6LBV8A00.xml
PATH=$repodir:$PATH

repo_ubc-220(){
  mkdir -p $yoctodir
  rm -rf $yoctodir/.repo
  cd $yoctodir && repo init -u $yoctourl -b $yoctobranch -m $yoctomanifest && repo sync
}
repo_ubc-220
