#!/bin/bash -l 
#SBATCH -A uppmax2024-2-7
#SBATCH --reservation uppmax2024-2-7_7
#SBATCH -M snowy
#SBATCH -p core 
#SBATCH -n 4
#SBATCH -t 04:00:00
#SBATCH -J Trimming_RNA
#SBATCH --mail-type=ALL
#SBATCH --mail-user gslottner@gmail.com

cat $0

module load bioinfo-tools trimmomatic

export SRCDIR=$HOME/Genome_analysis_repo/Data/Raw_Data/RNA_untrimmed/RNA_untrimmed
cd $SNIC_TMP

java -jar trimmomatic-0.39.jar PE -trimlog Trimlog_SRR4342137.txt $SRCDIR/SRR4342137.1.fastq.gz $SRCDIR/SRR4342137.2.fastq.gz -baseout SRR4342137.fastq.gz

java -jar trimmomatic-0.39.jar PE -trimlog Trimlog_SRR4342139.txt $SRCDIR/SRR4342139.1.fastq.gz $SRCDIR/SRR4342139.2.fastq.gz -baseout SRR4342139.fastq.gz

cp ./* $HOME/Genome_analysis_repo/Data/Trimmed_RNA
