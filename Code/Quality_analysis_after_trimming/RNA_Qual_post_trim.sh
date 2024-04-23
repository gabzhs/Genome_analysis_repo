#!/bin/bash -l 
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core 
#SBATCH -n 2
#SBATCH -t 00:20:00
#SBATCH -J Quality_analysis_test_RNA
#SBATCH --mail-type=ALL
#SBATCH --mail-user gslottner@gmail.com

cat $0

module load bioinfo-tools FastQC

export SRCDIR=$HOME/Genome_analysis_repo/Data

cd $SNIC_TMP

for i in `ls $SRCDIR/Trimmed_RNA`
do
fastqc $SRCDIR/Trimmed_RNA/${i}

done

cp ./*.html $SRCDIR/Quality_analysis_after_trimming
cp ./*.zip $SRCDIR/Quality_analysis_after_trimming
