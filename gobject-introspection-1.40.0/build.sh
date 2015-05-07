#! /bin/bash

# ref: https://binstar.org/pkgw/gobject-introspection
set -e # exit script if exit 1 is ever encountered

if [ "$(uname)" == "Linux" ]; then
    # TODO: Actually make this work...
    export FFI_CFLAGS=$PREFIX/include
    export FFI_LIBS=$PREFIX/lib
 #   export LIBFFI_CFLAGS="-I$PREFIX/include"
 #   export LIBFFI_LIBS="-L$PREFIX/lib -lffi"
#A    export LD_LIBRARY_PATH="${PREFIX}/lib:$LD_LIBRARY_PATH"
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

echo prefix $PREFIX
echo libffi-cflags $LIBFFI_CFLAGS
echo libffi-libs $LIBFFI_LIBS
#exit 1

./configure --prefix=$PREFIX # || { cat config.log ; exit 1 ; }
echo $PREFIX
echo $LIBFFI_CFLAGS
echo $LIBFFI_LIBS
make -j2
make install

set +e
