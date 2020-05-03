#!/bin/bash

# Build the patched glibc
git submodule init
git submodule update
mkdir glibc-build
pushd glibc-build
../glibc/configure --disable-sanity-checks
make -j4
popd

# Build the demo
make
