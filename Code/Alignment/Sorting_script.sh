#!/bin/bash -l 
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core 
#SBATCH -n 2
#SBATCH -t 00:30:00
#SBATCH -J Sorting
#SBATCH --mail-type=ALL
#SBATCH --mail-user gslottner@gmail.com

cat $0

module load bioinfo-tools samtools

export SRCDIR=/home/gahe8576/Genome_analysis_repo/Data

cd $SRCDIR/Alignment/Run_2

for i in `ls ./`
do
samtools sort $i -o ${i:0:8}.bam -I $SRCDIR/Bins/Best_bacterial_bins_run_1/${i:0:5};
done
