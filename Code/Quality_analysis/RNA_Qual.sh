#!/bin/bash -l 
#SBATCH -A uppmax2024-2-7
#SBATCH --reservation uppmax2024-2-7_5
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

cp $SRCDIR/Raw_Data/RNA_untrimmed/RNA_untrimmed/* $SNIC_TMP
cd $SNIC_TMP

for i in `ls $SRCDIR/Quality_analysis_before_trimming/RNA`
do
fastqc $i.fastq.gz

cp ./${i}_* $SRCDIR/Quality_analysis_before_trimming/RNA/${i}/
done
