#!/bin/bash

SCRIPT=$(readlink -f "$0")
BASEDIR=$(dirname "$SCRIPT")
cd $BASEDIR
if [ ! -d dynamicNeting ]
then
    echo "ERROR: can not find $BASEDIR/dynamicNeting directory."
    echo "  Please run this script in a regular directory of SDK_C++."
    exit -1
fi
which cmake
cmake --version 2>&1
tmp=$?
if [ ${tmp} -ne 0 ]
then
    echo "ERROR: You should install cmake(2.8 or later) first."
    echo "  Please goto https://cmake.org to download and install it."
    exit
fi

rm -fr bin
mkdir bin
rm -fr build
mkdir build
cd build

cmake ../dynamicNeting/src
tmp=$?
echo "cmake compile return:" ${tmp}
if [ ${tmp} -ne 0 ]
then
    echo "cmake compile <>return:" ${tmp}
    exit -1
fi

make
tmp=$?
echo "make return:" ${tmp}
if [ ${tmp} -ne 0 ]
then
    echo "make <>return:" ${tmp}
    exit -1
fi
