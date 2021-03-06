#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .

./configure --prefix=$PREFIX \
            --with-libxml-prefix=$PREFIX

make -j${CPU_COUNT} ${VERBOSE_AT}
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
make check
fi
make install

# We can remove this when we start using the new conda-build.
find $PREFIX -name '*.la' -delete
