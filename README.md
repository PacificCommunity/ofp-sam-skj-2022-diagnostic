# SKJ 2022 Diagnostic Model

Download SKJ 2022 assessment report:

- **Stock assessment of skipjack tuna in the western and central Pacific Ocean: 2022**\
  **[WCPFC-SC18-2022/SA-WP-01](https://meetings.wcpfc.int/node/16242)**

Download SKJ 2022 diagnostic model:

- Clone the **[skj-2022-diagnostic](https://github.com/PacificCommunity/ofp-sam-skj-2022-diagnostic)** repository or download as **[main.zip](https://github.com/PacificCommunity/ofp-sam-skj-2022-diagnostic/archive/refs/heads/main.zip)** file

Download SKJ 2022 grid results:

The [FAME website](https://fame.spc.int/resources/stockassessmentfiles) provides a `SKJ2022ForWeb.zip` file that contains the grid results in MFCL format.

## Reference model

In SPC assessment jargon, the *diagnostic model* is the reference model that is the basis of several sections and figures in the stock assessment report.

The diagnostic model is also the entry point when configuring and running the grid of ensemble models that is the basis of scientific advice. When the grid includes specific factor levels (for steepness, likelihood weights, etc.) the diagnostic model has intermediate levels, while other grid members explore higher and lower levels.

Finally, the diagnostic model is also the starting point for the SKJ 2025 stock assessment model development. One purpose of this repository is to give the stock assessor a good starting point that is organized and documented.

## Explore data, model settings, and results

The **[MFCL](MFCL)** folder includes all the MFCL input files, model settings, and output files.

The **TAF** folder extracts the data and results from MFCL format to CSV format that can be examined using Excel, R, or other statistical software. [TAF](https://cran.r-project.org/package=TAF) is a standard reproducible format for stock assessments that is practical for making the MFCL **[data](TAF/data)** and **[output](TAF/output)** available in a format that is easy to examine. The **[report](TAF/report)** folder contains formatted tables and example plots.

## Run the assessment model

The SKJ 2022 model takes around 12 hours to run. It requires a Linux platform, such as:

- Plain Linux machine, e.g. a personal laptop
- Windows Subsystem for Linux, optional feature in Windows
- Virtual machine, e.g. VirtualBox or VMware
- Online services that provide Linux machines

The `mfclo64` executable was compiled using *static linking*, so it should run on almost any Linux machine.

### Run in a Linux terminal

Navigate to the MFCL folder and run:

```
./doitall.sh
```

Alternatively, copy the required files into a new folder,

```
doitall.sh
mfcl.cfg
mfclo64
skj.frq
skj.ini
skj.tag
```

and then run the model:

```
./doitall.sh
```

### Run on Condor

SPC staff run most assessment models on a Condor cluster of Linux machines:

```
library(condor)
session <- ssh_connect("CONDOR_SUBMITTER_MACHINE")
condor_submit()
```

### Run in TAF format

Anyone can run the assessment analysis in TAF format. First install TAF, FLCore, and FLR4MFCL, if they are not already installed:

```
install.packages("TAF")
install_github("flr/FLCore")
install_github("PacificCommunity/FLR4MFCL")
```

On a Linux machine, the full assessment model can be run as a TAF analysis. Start R, make sure the TAF folder is the working directory, and then run:

```
library(TAF)
taf.boot()
source.taf("data.R")
source.taf("model.R")
source.taf("output.R")
source.taf("report.R")
```

A shortcut script is provided, to run the TAF analysis in 1 minute rather than 12 hours:

```
library(TAF)
taf.boot()
source.taf("data.R")
source.taf("model_shortcut.R")
source.taf("output.R")
source.taf("report.R")
```

The TAF shortcut analysis runs an all platforms: Windows, Linux, and macOS. It extracts the data and output from the MFCL files and makes them available as CSV files that can be examined and analyzed further.
