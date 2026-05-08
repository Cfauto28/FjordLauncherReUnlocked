#! /usr/bin/env bash

cmake --preset linux -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++

cmake --build --preset linux --config Release -j$(nproc)

cmake --install build --config Release

cmake --install build --config Release --component portable
