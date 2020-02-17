
include macro.mk

.PHONY: all prepare build

all: prepare build

prepare: $(builddir) $(repo) $(yoctodir) $(builddir)/.repo $(builddir)/.setenv $(builddir)/.downloads

build: $(builddir)/.build

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
#	@cd $(yoctodir) && MACHINE=$(yoctomachine) EULA=1 source fsl-setup-release.sh -b $(yoctobuilddir) -e $(yoctodistro)
	@cd $(yoctodir) && DISTRO= $(yoctodistro) \
		MACHINE=$(yoctomachine) EULA=1 source fsl-setup-release.sh -b $(yoctobuilddir)
	@touch $(yoctodir)/$(yoctobuilddir)/conf/sanity.conf
	@touch $@

$(builddir)/.build:
	@exec > >(tee -i -a log.build); exec 2>&1; set -x;  cd $(yoctodir) && source setup-environment $(yoctobuilddir) && bitbake core-image-minimal -vDDD

clean:
	@rm -rf $(builddir)
