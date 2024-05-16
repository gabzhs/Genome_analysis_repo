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

cd $SRCDIR

for i in `ls $SRCDIR/Bins/Best_bacterial_bins_run_1/*.fa`
do
htseq-count --format bam --order pos /Alignment/Run_2/$i.37.bam /Functional_prediction/Run_2_good_bins/Bacterial_features_without_nucleotides/$i.gff > /Counted_reads/Run_1/$i.37_counts.txt
htseq-count --format bam --order pos /Alignment/Run_2/$i.39.bam /Functional_prediction/Run_2_good_bins/Bacterial_features_without_nucleotides/$i.gff > /Counted_reads/Run_1/$i.39_counts.txt
done
