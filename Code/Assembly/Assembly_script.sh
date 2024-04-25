#!/bin/bash -l 
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core 
#SBATCH -n 4
#SBATCH -t 08:00:00
#SBATCH -J Metagenome_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user gslottner@gmail.com

cat $0

module load bioinfo-tools megahit

export SRCDIR=$HOME/Genome_analysis_repo/Data

megahit --kmin-1pass --k-min 59 --k-max 99 --k-step 10  -1 $SRCDIR/Raw_Data/DNA_trimmed/DNA_trimmed/SRR4342129_1.paired.trimmed.fastq.gz,$SRCDIR/Raw_Data/DNA_trimmed/DNA_trimmed/SRR4342133_1.paired.trimmed.fastq.gz -2 $SRCDIR/Raw_Data/DNA_trimmed/DNA_trimmed/SRR4342129_2.paired.trimmed.fastq.gz,$SRCDIR/Raw_Data/DNA_trimmed/DNA_trimmed/SRR4342133_2.paired.trimmed.fastq.gz -o $SRCDIR/Metagenome_assembly/Run_6
