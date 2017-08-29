#!/bin/bash

if [[ "$CXX" == clang* ]]; then
    export CXXFLAGS="-stdlib=libc++"
    sudo apt-add-repository "deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.9 main"
    sudo apt-get update
    sudo apt-get install -y libc++-dev libc++-helpers libc++1 libc++abi-dev lldb-3.9
fi

[ ! -d build ] && mkdir build
(
    pushd build
    cmake -DUNITTEST=ON -DCPP14TEST=ON ..
    make
    make unittest
)
