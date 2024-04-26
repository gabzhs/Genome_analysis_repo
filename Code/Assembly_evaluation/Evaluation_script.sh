#!/bin/bash -l 
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core 
#SBATCH -n 2
#SBATCH -t 01:30:00
#SBATCH -J Assembly_evaluation
#SBATCH --mail-type=ALL
#SBATCH --mail-user gslottner@gmail.com

cat $0

module load bioinfo-tools quast

/sw/bioinfo/quast/5.0.2/snowy/bin/metaquast.py /home/gahe8576/Genome_analysis_repo/Data/Metagenome_assembly/Run_6/final.contigs.fa -o /home/gahe8576/Genome_analysis_repo/Data/Assembly_evaluation/Run_2
