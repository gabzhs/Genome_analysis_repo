#!/bin/bash -l 
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core 
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J Alignment_but_better
#SBATCH --mail-type=ALL
#SBATCH --mail-user gslottner@gmail.com

cat $0

module load bioinfo-tools bwa

export SRCDIR=/home/gahe8576/Genome_analysis_repo/Data

cd $SRCDIR/Alignment

for i in `ls $SRCDIR/Bins/Best_bacterial_bins_run_1`
do
bwa index $SRCDIR/Bins/Best_bacterial_bins_run_1/$i;

bwa mem -t 8 $SRCDIR/Bins/Best_bacterial_bins_run_1/$i $SRCDIR/Trimmed_RNA/SRR4342137_1P.fastq.gz $SRCDIR/Trimmed_RNA/SRR4342137_2P.fastq.gz > Run_2/$i.37.sam;

bwa mem -t 8 $SRCDIR/Bins/Best_bacterial_bins_run_1/$i $SRCDIR/Trimmed_RNA/SRR4342139_1P.fastq.gz $SRCDIR/Trimmed_RNA/SRR4342139_2P.fastq.gz > Run_2/$i.39.sam;
done
