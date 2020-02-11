
currdir=$(shell realpath $(shell pwd))
builddir=$(currdir)/build
downloadsdir=$(currdir)/downloads
#downloadsdir=/share/downloads
repodir=$(builddir)/bin
repo=$(repodir)/repo
repourl=http://commondatastorage.googleapis.com/git-repo-downloads/repo
repogiturl=https://gerrit.googlesource.com/git-repo
yoctodir=$(builddir)/yocto
yoctourl=git://github.com/ADVANTECH-Corp/adv-arm-yocto-bsp.git
#yoctobranch=refs/tags/imx6LBV8040
yoctobranch=refs/tags/imx6LBV8A00.xml
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

.PHONY: all

all: $(builddir) $(repo) $(yoctodir) $(builddir)/.repo $(builddir)/.setenv $(builddir)/.downloads $(builddir)/.build

prepare: $(builddir) $(repo) $(yoctodir) $(builddir)/.repo $(builddir)/.setenv $(builddir)/.downloads

$(builddir)/.downloads:
	@[ -d "$(downloadsdir)" ] && ln -sf $(downloadsdir) $(yoctodir)/downloads
	@touch $@

$(repo): 
#	@mkdir -p $(repodir)
#	@curl -s $(repourl) -o $(repo)
	@git clone --branch v1.13.9.4 $(repogiturl) $(repodir) && rm -rf $(repodir)/.git
	@chmod a+x $(repo)

$(builddir) $(yoctodir):
	@mkdir -p $@

$(builddir)/.repo:
	@cd $(yoctodir) && $(repo) init -u $(yoctourl) -b $(yoctobranch) -m $(yoctomanifest) && $(repo) sync
	@touch $@

$(builddir)/.setenv:
	@cd $(yoctodir) && MACHINE=$(yoctomachine) EULA=1 source fsl-setup-release.sh -b $(yoctobuilddir) -e $(yoctodistro)
	@touch $(yoctodir)/$(yoctobuilddir)/conf/sanity.conf
	@touch $@

$(builddir)/.build:
	@cd $(yoctodir) && source setup-environment $(yoctobuilddir) && bitbake core-image-minimal

clean:
	@rm -rf $(builddir)
