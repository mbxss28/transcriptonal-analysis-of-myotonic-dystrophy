#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --mem=100g
#SBATCH --time=72:00:00
#SBATCH --job-name=chr
#SBATCH --output=/gpfs01/home/mbxss28/slurm_output/chr-%x-%j.out
#SBATCH --error=/gpfs01/home/mbxss28/slurm_err/chr-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxss28@nottingham.ac.uk



cat  gencode.v47.annotation.gtf | grep "chr"
