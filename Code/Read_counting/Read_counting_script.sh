#!/bin/bash -l 
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core 
#SBATCH -n 2
#SBATCH -t 08:00:00
#SBATCH -J Read_counting
#SBATCH --mail-type=ALL
#SBATCH --mail-user gslottner@gmail.com

cat $0

module load bioinfo-tools htseq

export SRCDIR=/home/gahe8576/Genome_analysis_repo/Data

cd $SRCDIR/Alignment

for i in `ls $SRCDIR/Bins/Best_bacterial_bins_run_1`
