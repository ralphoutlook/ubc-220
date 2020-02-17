#script=$(realpath ${BASH_SOURCE[0]})
#currdir=$(dirname $script)
currdir=$(pwd)
builddir=$currdir/build
repodir=$builddir/bin
yoctodir=$builddir/yocto
yoctourl=git://github.com/ADVANTECH-Corp/adv-arm-yocto-bsp.git
#yoctobranch=refs/tags/imx6LBV8040
yoctobranch=refs/tags/imx6LBV8A00
#yoctomanifest=imx6LBV8040.xml
yoctomanifest=imx6LBV8A00.xml
#PATH=$repodir:$PATH
yoctomachine=imx6dlubc220a1
yoctobuilddir=build.$yoctomachine
yoctodistro=x11
cd $yoctodir
DISTRO=$yoctodistro \
  MACHINE=$yoctomachine \
  EULA=1 \
  source fsl-setup-release.sh -b $yoctobuilddir
cd $yoctodir/$yoctobuilddir
ln -sf ~/downloads downloads
touch $yoctodir/$yoctobuilddir/sanity.conf
