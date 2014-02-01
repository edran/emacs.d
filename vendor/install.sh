#!/bin/sh
# Run just after having cloned the repository

echo "#################### Haskell Mode is compiling ####################"
cd haskell-mode
make all
cd ..
echo "####################     DONE:Haskell Mode     ####################"
