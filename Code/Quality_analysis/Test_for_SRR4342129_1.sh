#!/bin/bash -l 
#SBATCH -A uppmax2024-2-7
#SBATCH --reservation uppmax2024-2-7_3
#SBATCH -M snowy
#SBATCH -p core 
#SBATCH -n 2
#SBATCH -t 00:20:00
#SBATCH -J Quality_analysis_test
#SBATCH --mail-type=ALL
#SBATCH --mail-user gslottner@gmail.com

module load bioinfo-tools FastQC

export SRCDIR=$HOME/Genome_analysis_repo/Data/Raw_Data/RNA_untrimmed/RNA_untrimmed
cp $SRCDIR/SRR4342137.1.fastq.gz $SNIC_TMP
cd $SNIC_TMP

fastqc SRR4342137.1.fastq.gz

cp ./* $SRCDIR/../../../Quality_analysis_before_trimming/SRR4342137.1
