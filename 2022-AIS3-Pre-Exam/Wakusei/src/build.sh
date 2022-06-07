#!/bin/bash

BUILD_PATH=./build/
cmake -S. -B$BUILD_PATH
make -C $BUILD_PATH clean
make -C $BUILD_PATH -j 