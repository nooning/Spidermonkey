#!/bin/sh

cpus=$(sysctl hw.ncpu | awk '{print $2}')

# configure
../configure --disable-tests --disable-shared-js \
            --enable-strip --enable-strip-install \
            --disable-root-analysis --disable-exact-rooting --enable-gcincremental --enable-optimize=-O3 \
            --enable-llvm-hacks \
            --enable-debug \
            --enable-intl-api=no
# make
xcrun make -j$cpus

# strip
xcrun strip -S libjs_static.a

# info
xcrun lipo -info libjs_static.a

