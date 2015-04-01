# RCADE
Recognition Code-Assisted Discovery of regulatory Elements (http://rcade.ccbr.utoronto.ca/)

Motif discovery from ChIP-seq data is often limited by presence of non-targeted transcription factor motifs, as well as similarity of peak sequences due to common ancestry rather than common binding factors. The latter aspect particularly affects a large number of proteins from the Cys2His2 zinc finger (C2H2-ZF) class of transcription factors, as their binding sites are often dominated by endogenous repeat elements (EREs) that have highly similar sequences. To overcome these limits, RCADE combines predictions from a DNA recognition code of C2H2-ZFs with ChIP-seq data to identify models that represent the genuine DNA binding prefer-ences of C2H2-ZF proteins.


## Requirements
Unix-compatible OS
R version 3.0.1 or later (http://www.r-project.org/)
R “randomForest” library (http://cran.r-project.org/web/packages/randomForest/index.html)
GNU-compatible MAKE software (https://gcc.gnu.org/)
MEME Suite (http://meme.nbcr.net/meme/downloads.html)
 
## Installation
Step 1. To install the program, extract the package, and run the "make" command.
Step 2. Change the value of line 7 of the “RCOpt.sh” script to where the executable MEME files are located on your computer.
 
To test the pipeline, execute this command:
bash RCOpt.sh MyTestJob examples/CTCF.fasta examples/GSM1407629.500bp.fasta
This should create a “./out/MyTestJob” folder, with the RCADE output files described above.
 
## Usage
Use the RCOpt.sh script to run RCADE on your dataset:
bash RCOpt.sh <job_name> <C2H2_fasta> <ChIP_fasta>
