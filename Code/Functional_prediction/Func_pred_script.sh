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

INPUT = /home/gahe8576/Genome_analysis_repo/Data/Bins/Good_bins_run_1
OUTPUT = /home/gahe8576/Genome_analysis_repo/Data/Functional_prediction/Run_1_good_bins

for i in `ls $INPUT/Bacteria`;
do
prokka --outdir $OUTPUT/Bacteria --prefix $i $i;
done

for i in `ls $INPUT/Archaea`;
do 
prokka --kingdom Archaea --outdir $OUTPUT/Archaea --prefix $i $i;
done
