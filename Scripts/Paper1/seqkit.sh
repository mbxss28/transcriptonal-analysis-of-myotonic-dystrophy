#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --mem=100g
#SBATCH --time=48:00:00
#SBATCH --job-name=seqkit
#SBATCH --output=/gpfs01/home/mbxss28/slurm_output/seqkit-%x-%j.out
#SBATCH --error=/gpfs01/home/mbxss28/slurm_err/seqkit-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxss28@nottingham.ac.uk

source $HOME/.bash_profile

conda activate seqkit

seqkit fx2tab -nl /gpfs01/home/mbxss28/DM/paper1/fastp/fastq/p1_20_1.fastq.gz
