#! /usr/bin/env bash

cmake --preset linux

cmake --build --preset linux --config Release -j$(nproc)

cmake --install build --config Release

cmake --install build --config Release --component portable
