currdir=$(shell realpath $(shell pwd))
builddir=$(currdir)/build
downloadsdir=/root/downloads
#downloadsdir=/share/downloads
repodir=$(builddir)/bin
repo=$(repodir)/repo
repourl=http://commondatastorage.googleapis.com/git-repo-downloads/repo
repogiturl=https://gerrit.googlesource.com/git-repo
yoctodir=$(builddir)/yocto
yoctourl=git://github.com/ADVANTECH-Corp/adv-arm-yocto-bsp.git
#yoctobranch=refs/tags/imx6LBV8040
yoctobranch=refs/tags/imx6LBV8A00
#yoctomanifest=imx6LBV8040.xml
yoctomanifest=imx6LBV8A00.xml
###############################################################
# latest yocto code
# yoctourl=git://github.com/ADVANTECH-Corp/adv-arm-yocto-bsp.git
# yoctobranch=imx-4.1-krogoth
# yoctomanifest=
###############################################################
#yoctomachine=imx6qwise3310a1
yoctomachine=imx6dlubc220a1
yoctobuilddir=build.$(yoctomachine)
yoctodistro=x11
SHELL=/bin/bash
