#!/bin/bash -l 
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core 
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J Read_counting
#SBATCH --mail-type=ALL
#SBATCH --mail-user gslottner@gmail.com

cat $0

module load bioinfo-tools htseq

export SRCDIR=/home/gahe8576/Genome_analysis_repo/Data

cd $SRCDIR/Alignment/Run_2

for i in 23.fa 25.fa 31.fa ;
do
htseq-count --stranded=no --format bam --order pos $i.37.bam $SRCDIR/Functional_prediction/Run_2_good_bins/Bacterial_features_without_nucleotides/$i.gff > $SRCDIR/Counted_reads/Run_4/$i.37_counts.txt
htseq-count --stranded=no --format bam --order pos $i.39.bam $SRCDIR/Functional_prediction/Run_2_good_bins/Bacterial_features_without_nucleotides/$i.gff > $SRCDIR/Counted_reads/Run_4/$i.39_counts.txt
done
