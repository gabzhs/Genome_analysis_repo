#!/bin/bash -l 
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core 
#SBATCH -n 4
#SBATCH -t 08:00:00
#SBATCH -J Prediction_of_phylogeny
#SBATCH --mail-type=ALL
#SBATCH --mail-user gslottner@gmail.com

module load bioinfo-tools biopython FastTree muscle usearch/5.2.32 conda

export CONDA_ENVS_PATH=/proj/uppmax2024-2-7/Genome_Analysis/conda_envs
source conda_init.sh
conda activate phylophlan

phylophlan_assign_sgbs -i $HOME/Genome_analysis_repo/Data/Bins/Run_1 -o $HOME/Genome_analysis_repo/Data/Phylogenetic_prediction/Run_1 --nproc 4 -d SGB.Jan21 --database_folder /proj/uppmax2024-2-7/Genome_Analysis/conda_envs/SGB/phylophlan_databases -f /proj/uppmax2024-2-7/Genome_Analysis/conda_envs/configs
