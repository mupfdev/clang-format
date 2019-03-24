#! /bin/sh

if [ $# -gt 0 ]
then
    sed -i 's/#define /\/\/#define /g' $@
    sed -i 's/#ifdef /\/\/#ifdef /g'   $@
    sed -i 's/#ifndef /\/\/#ifndef /g' $@
    sed -i 's/#elif /\/\/#elif /g'     $@
    sed -i 's/#else/\/\/#else/g'       $@
    sed -i 's/#endif/\/\/#endif/g'     $@
    sed -i 's/#pragma /\/\/#pragma /g' $@

    clang-format -i $@

    sed -i 's/\/\/ *#define /#define /g' $@
    sed -i 's/\/\/ *#ifdef /#ifdef /g'   $@
    sed -i 's/\/\/ *#ifndef /#ifndef /g' $@
    sed -i 's/\/\/ *#elif /#elif /g'     $@
    sed -i 's/\/\/ *#else/#else/g'       $@
    sed -i 's/\/\/ *#endif/#endif/g'     $@
    sed -i 's/\/\/ *#pragma /#pragma /g' $@
else
    echo "Usage: $0 <file(s)>"
fi
