#! /bin/bash

# ref: https://binstar.org/pkgw/glib
set -e

if [ "$(uname)" == "Linux" ]; then
    # TODO: Actually make this work...
    export LIBFFI_CFLAGS="-I$PREFIX/include"
    export LIBFFI_LIBS="-L$PREFIX/lib -lffi"
    #export LD_LIBRARY_PATH="${PREFIX}/lib/:$LD_LIBRARY_PATH"
    export PATH=$PREFIX/bin:$PATH
fi

if [ "$(uname)" == "Darwin" ]; then
    # TODO
    # export LIBFFI_CFLAGS="-I/usr/local/Cellar/libffi/3.0.13/include"
    # export LIBFFI_LIBS="-lffi -L/usr/local/Cellar/libffi/3.0.13/lib/"

    # or using pkgconfig, which requires brew/etc to have installed it
    export PKG_CONFIG_PATH=/usr/local/Cellar/libffi/3.0.13/lib/pkgconfig/
    export PATH=$PREFIX/bin:$PATH
fi
echo $PREFIX
echo $LIBFFI_CFLAGS
echo $LIBFFI_LIBS
./configure --prefix=$PREFIX # || { cat config.log ; exit 1 ; }
make -j2
make install

cd $PREFIX
rm -rf share/bash-completion share/gdb share/gtk-doc share/systemtap

set +e
