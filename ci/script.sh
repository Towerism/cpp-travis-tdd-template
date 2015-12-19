#!/bin/bash
set -ev

TEST_CONFIG=

if [ "${TEST_SUITE}" == "unit" ]; then
  TEST_CONFIG=-DGENERIC_TEST_INTEGRATION=OFF
elif [ "${TEST_SUITE}" == "integration" ]; then
  TEST_CONFIG=-DGENERIC_TEST_UNIT=OFF
fi

export CXX=g++-5
mkdir -p build && cd build
cmake -DGENERIC_TEST=ON ${TEST_CONFIG} ..
make
ctest -VV
