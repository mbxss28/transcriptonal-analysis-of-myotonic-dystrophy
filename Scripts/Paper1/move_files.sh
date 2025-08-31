#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --mem=100g
#SBATCH --time=48:00:00
#SBATCH --job-name=move
#SBATCH --output=/gpfs01/home/mbxss28/slurm_output/move-%x-%j.out
#SBATCH --error=/gpfs01/home/mbxss28/slurm_err/move-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxss28@nottingham.ac.uk

cp SRR* /gpfs01/home/mbxss28/DM/paper1/SRR_files

cp p1_*_*.fastq.gz /gpfs01/home/mbxss28/DM/paper1/fastp/fastq

cp *.html /gpfs01/home/mbxss28/DM/paper1/fastp/QC
