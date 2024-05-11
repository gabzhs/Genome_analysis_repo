#!/bin/bash -l 
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core 
#SBATCH -n 4
#SBATCH -t 02:00:00
#SBATCH -J Prediction_of_function
#SBATCH --mail-type=ALL
#SBATCH --mail-user gslottner@gmail.com

module load bioinfo-tools prokka

input = /home/gahe8576/Genome_analysis_repo/Data/Bins/Good_bins_run_1
output = /home/gahe8576/Genome_analysis_repo/Data/Functional_prediction/Run_1_good_bins

for i in `ls ${input}/Bacteria/`;
do
prokka --outdir ${output}/Bacteria/ --prefix $i $i;
done

for i in `ls ${input}/Archaea/`;
do 
prokka --kingdom Archaea --outdir ${output}/Archaea/ --prefix $i $i;
done
