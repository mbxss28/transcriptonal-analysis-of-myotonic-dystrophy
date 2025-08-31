#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=30
#SBATCH --mem=100g
#SBATCH --time=48:00:00
#SBATCH --job-name=p1download
#SBATCH --output=/gpfs01/home/mbxss28/slurm_output/download_p1-%x-%j.out
#SBATCH --error=/gpfs01/home/mbxss28/slurm_err/download_p1-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxss28@nottingham.ac.uk#

gunzip GRCh38.primary_assembly.genome.fa.gz

gunzip gencode.v47.annotation.gtf.gz

gunzip gencode.v47.transcripts.fa.gz
