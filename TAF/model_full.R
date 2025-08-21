## Run analysis, write model results

## Before: doitall.sh, mfcl.cfg, skj.frq, skj.ini, skj.tag (boot/data),
##         mfclo64 (boot/software)
## After:

library(TAF)

mkdir("model")

# Software
cp("boot/software/mfclo64", "model")

# Input files
cp("boot/data/doitall.sh", "model")
cp("boot/data/mfcl.cfg",   "model")
cp("boot/data/skj.frq",    "model")
cp("boot/data/skj.ini",    "model")
cp("boot/data/skj.tag",    "model")

# Run model
setwd("model")
system("doitall.sh")
setwd("..")
