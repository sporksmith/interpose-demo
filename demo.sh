#!/bin/bash

echo "Running call_write without interposition:"
./call_write

echo "Running call_write with interposition:"
LD_PRELOAD=$PWD/libinterpose.so ./call_write
