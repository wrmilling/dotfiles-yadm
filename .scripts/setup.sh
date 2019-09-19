#!/usr/bin/env bash

if [[ "$OSTYPE" == "darwin"* ]]; then
  ./components/osx.sh
else
  ./components/linux.sh
fi
