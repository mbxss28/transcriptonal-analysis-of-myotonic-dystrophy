#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=30
#SBATCH --mem=100g
#SBATCH --time=48:00:00
#SBATCH --job-name=index
#SBATCH --output=/gpfs01/home/mbxss28/slurm_output/index_p1-%x-%j.out
#SBATCH --error=/gpfs01/home/mbxss28/slurm_err/index_p1-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxss28@nottingham.ac.uk#

source $HOME/.bash_profile

conda activate salmon
trans=/gpfs01/home/mbxss28/DM/reference/GRCh_transcipts.fa
chr=/gpfs01/home/mbxss28/DM/reference/chr.txt

salmon index -t $trans -d $chr -i GRC_index --gencode
