#!/bin/bash -l 
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core 
#SBATCH -n 2
#SBATCH -t 00:45:00
#SBATCH -J Binning
#SBATCH --mail-type=ALL
#SBATCH --mail-user gslottner@gmail.com

cat $0

module load bioinfo-tools MetaBat

export SRCDIR=$HOME/Genome_analysis_repo/Data

metabat -i $SRCDIR/Metagenome_assembly/Run_6/final.contigs.fa -o $SRCDIR/Bins/Run_1
