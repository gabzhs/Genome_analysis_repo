#!/bin/bash -l 
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core 
#SBATCH -n 4
#SBATCH -t 03:00:00
#SBATCH -J Binning
#SBATCH --mail-type=ALL
#SBATCH --mail-user gslottner@gmail.com

cat $0

module load bioinfo-tools CheckM/1.1.3


