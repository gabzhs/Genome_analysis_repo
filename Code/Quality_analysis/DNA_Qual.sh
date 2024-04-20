#!/bin/bash -l 
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core 
#SBATCH -n 2
#SBATCH -t 00:20:00
#SBATCH -J Quality_analysis_test_DNA
#SBATCH --mail-type=ALL
#SBATCH --mail-user gslottner@gmail.com

cat $0

module load bioinfo-tools FastQC

export SRCDIR=$HOME/Genome_analysis_repo/Data

cp $SRCDIR/Raw_Data/DNA_trimmed/DNA_trimmed/* $SNIC_TMP
cd $SNIC_TMP

gunzip *.gz

for i in `ls $SRCDIR/Quality_analysis_before_trimming/DNA`
do
fastqc $i.paired.trimmed.fastq

cp ./${i}_* $SRCDIR/Quality_analysis_before_trimming/DNA/${i}/
done
