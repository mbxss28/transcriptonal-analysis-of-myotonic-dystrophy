#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=30
#SBATCH --mem=100g
#SBATCH --time=72:00:00
#SBATCH --job-name=quantp3
#SBATCH --output=/gpfs01/home/mbxss28/slurm_output/quant_p3-%x-%j.out
#SBATCH --error=/gpfs01/home/mbxss28/slurm_err/quant_p3-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxss28@nottingham.ac.uk

source $HOME/.bash_profile

conda activate salmon

index=/gpfs01/home/mbxss28/DM/paper1/Salmon/GRC_index

for i in $(ls *_1*.fastq.gz | sed -r 's/_1[.]fastq.gz//' | uniq); do

salmon quant --index $index --libType A -1 ${i}_1.fastq.gz -2 ${i}_2.fastq.gz --validateMappings --gcBias -o ${i}_quant

done
