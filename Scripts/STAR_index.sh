#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --mem=100g
#SBATCH --time=48:00:00
#SBATCH --job-name=STAR_index
#SBATCH --output=/gpfs01/home/mbxss28/slurm_output/STAR_index-%x-%j.out
#SBATCH --error=/gpfs01/home/mbxss28/slurm_err/STAR_index-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxss28@nottingham.ac.uk



source $HOME/.bash_profile

conda activate STAR

fa=/gpfs01/home/mbxss28/DM/reference/GRCh38.primary_assembly.genome.fa
gtf=/gpfs01/home/mbxss28/DM/reference/gencode.v47.annotation.gtf


STAR --runMode genomeGenerate --runThreadN 12 --genomeDir STAR_index --genomeFastaFiles $fa --sjdbGTFfile $gtf --sjdbOverhang 75

