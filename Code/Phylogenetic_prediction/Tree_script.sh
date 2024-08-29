#!/bin/bash -l 
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core 
#SBATCH -n 4
#SBATCH -t 07:00:00
#SBATCH -J Making_a_tree
#SBATCH --mail-type=ALL
#SBATCH --mail-user gslottner@gmail.com

module load bioinfo-tools FastTree muscle usearch/5.2.32 conda

export CONDA_ENVS_PATH=/proj/uppmax2024-2-7/Genome_Analysis/conda_envs
source conda_init.sh
conda activate phylophlan

cd $HOME/Genome_analysis_repo/Data/Phylogenetic_prediction/Run_4/

phylophlan_write_default_configs.sh

phylophlan -i $HOME/Genome_analysis_repo/Data/Bins/Best_bacterial_bins_run_1 --genome_extension fa -o $HOME/Genome_analysis_repo/Data/Phylogenetic_prediction/Run_4/Phylophlan --nproc 4 -d phylophlan -f $HOME/Genome_analysis_repo/Data/Phylogenetic_prediction/Run_3/supermatrix_nt.cfg --diversity high
