#!/bin/bash

show_cmd () {
  echo "  \$ $1"
  #bash -c "$1 | sed 's/^/  /'"
  bash -c "$1" | sed 's/^/  /'
}

echo "Suppose we have a program, call_write.c, that writes some strings to stdout:"
show_cmd "cat ./call_write.c"

echo "Output of call_write:\n"
show_cmd "./call_write"

echo "Suppose we want to double all output to stdout."
echo "All of the functions in call_write ultimately make a write syscall, so we interpose the syscall function directly:"
show_cmd "cat ./interpose.c"

echo "Unfortunately, it turns out that the libc implementations of these functions make inlined syscalls,"
echo "so this only successfully interposes on and doubles the actual call to syscall:"
show_cmd 'LD_PRELOAD=$PWD/libinterpose.so ./call_write'

echo "We can fix this by using a patched libc that replaces inlined syscalls with calls to the syscall function,"
echo "and also LD_PRELOAD'ing that. Note that the functions that operate on the stdout file stream actually"
echo "write to an in-memory buffer. A 'write' syscall happens at the end when the whole buffer is flushed."
show_cmd 'LD_PRELOAD=$PWD/libinterpose.so:$PWD/libc.so ./call_write'

#echo "Running call_write with interposition:"
#LD_PRELOAD=$PWD/libinterpose.so ./call_write
