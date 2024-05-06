#!/bin/bash -l 
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core 
#SBATCH -n 4
#SBATCH -t 03:00:00
#SBATCH -J Binning_evaluation
#SBATCH --mail-type=ALL
#SBATCH --mail-user gslottner@gmail.com

cat $0

module load bioinfo-tools CheckM/1.1.3

checkm data setRoot /home/gahe8576/Genome_analysis_repo/Data/Bin_evaluation/CheckM_data

checkm lineage_wf -t 16 -x fa --reduced_tree /home/gahe8576/Genome_analysis_repo/Data/Bins/Run_1 /home/gahe8576/Genome_analysis_repo/Data/Bin_evaluation/Run_1
