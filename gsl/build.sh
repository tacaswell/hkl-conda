./configure --prefix=$PREFIX #|| { cat config.log ; exit 1 ; }

make
make check
make install
