#!/bin/bash -l 
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core 
#SBATCH -n 2
#SBATCH -t 08:00:00
#SBATCH -J Alignment
#SBATCH --mail-type=ALL
#SBATCH --mail-user gslottner@gmail.com

cat $0

module load bioinfo-tools bwa

export SRCDIR=/home/gahe8576/Genome_analysis_repo/Data

cd $SRCDIR/Alignment

for i in `ls $SRCDIR/Bins/Best_bacterial_bins_run_1`
do
bwa index $SRCDIR/Bins/Best_bacterial_bins_run_1/$i

bwa mem -t 8 $SRCDIR/Bins/Best_bacterial_bins_run_1/$i $SRCDIR/Trimmed_RNA/SRR4342137_1P.fastq.gz > Run_1/$i.37_1P.sam;

bwa mem	-t 8 $SRCDIR/Bins/Best_bacterial_bins_run_1/$i $SRCDIR/Trimmed_RNA/SRR4342137_2P.fastq.gz > Run_1/$i.37_2P.sam;

bwa mem -t 8 $SRCDIR/Bins/Best_bacterial_bins_run_1/$i $SRCDIR/Trimmed_RNA/SRR4342139_1P.fastq.gz > Run_1/$i.39_1P.sam;

bwa mem -t 8 $SRCDIR/Bins/Best_bacterial_bins_run_1/$i $SRCDIR/Trimmed_RNA/SRR4342139_2P.fastq.gz > Run_1/$i.39_2P.sam;
done
