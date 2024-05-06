#!/bin/bash -l 
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core 
#SBATCH -n 2
#SBATCH -t 08:00:00
#SBATCH -J Prediction_of_phylogeny
#SBATCH --mail-type=ALL
#SBATCH --mail-user gslottner@gmail.com

module load bioinfo-tools
