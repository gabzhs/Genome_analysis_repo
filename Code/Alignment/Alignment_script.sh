#!/bin/bash -l 
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core 
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J Alignment
#SBATCH --mail-type=ALL
#SBATCH --mail-user gslottner@gmail.com

cat $0

module load bioinfo-tools bwa

export SRCDIR = /home/gahe8576/Genome_analysis_repo/Data

for i in `ls $SRCDIR/Raw_Data/RNA_untrimmed/RNA_untrimmed`
do
