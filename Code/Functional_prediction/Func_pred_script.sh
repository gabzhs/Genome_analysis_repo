#!/bin/bash -l 
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core 
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J Prediction_of_function
#SBATCH --mail-type=ALL
#SBATCH --mail-user gslottner@gmail.com

cat $0

module load bioinfo-tools prokka

export SRCDIR=$HOME/Genome_analysis_repo/Data

export INPUT=$SRCDIR/Bins/Good_bins_run_1
export OUTPUT=$SRCDIR/Functional_prediction/Run_1_good_bins

for i in `ls $INPUT/Bacteria`;
do
prokka --outdir $OUTPUT --prefix $i $INPUT/Bacteria/$i;
done

for i in `ls $INPUT/Archaea`;
do 
prokka --kingdom Archaea --outdir $OUTPUT --prefix $i $INPUT/Archaea/$i;
done
