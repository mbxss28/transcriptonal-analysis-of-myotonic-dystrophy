#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --mem=100g
#SBATCH --time=48:00:00
#SBATCH --job-name=paper4move
#SBATCH --output=/gpfs01/home/mbxss28/slurm_output/movep4-%x-%j.out
#SBATCH --error=/gpfs01/home/mbxss28/slurm_err/movep4-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxss28@nottingham.ac.uk


cp fastp.sh /gpfs01/home/mbxss28/DM/paper4/SRR_Files


#cp SRR* /gpfs01/home/mbxss28/DM/paper4/SRR_Files


#cp p4*.fastq.gz /gpfs01/home/mbxss28/DM/paper4/Salmon


#cp  *.html  /gpfs01/home/mbxss28/DM/paper4/QC
