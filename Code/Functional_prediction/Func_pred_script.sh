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
export OUTPUT=$SRCDIR/Functional_prediction/Run_2_good_bins

for i in `ls $INPUT/Bacteria`;
do
prokka --outdir $OUTPUT/Bacteria --prefix $i $INPUT/Bacteria/$i --force;
done

for i in `ls $INPUT/Archaea`;
do 
prokka --kingdom Archaea --outdir $OUTPUT/Bacteria --prefix $i $INPUT/Archaea/$i --force;
done
