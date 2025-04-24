#!/bin/bash

pwd
ls -l
echo $PATH
set

# Upack everything from the tar file
tar -xzmf Start.tar.gz
mv condor_doitall*.* doitall.condor
dos2unix doitall.condor
export MFCL=./mfclo64
# rm mfclo64.exe
# rm *.dll
dos2unix *.par
chmod 700 mfclo64
chmod 700 doitall.condor

./doitall.condor

# Create empty file so that it does not mess up when repacking tar
touch End.tar.gz
# Repack everything except tar files so that this is all that needs to be exported
tar -czf End.tar.gz --exclude '*.tar.gz' --exclude '_condor_*' --exclude 'condor_exec.*' *

# rm mfclo64


