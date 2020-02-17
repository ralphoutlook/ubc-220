script=$(realpath ${BASH_SOURCE[0]})
currdir=$(dirname $script)
builddir=$currdir/build
repodir=$builddir/bin
PATH=$repodir:$PATH
