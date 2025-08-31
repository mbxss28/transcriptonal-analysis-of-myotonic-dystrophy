#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --mem=100g
#SBATCH --time=72:00:00
#SBATCH --job-name=qualiALS
#SBATCH --output=/gpfs01/home/mbxss28/slurm_output/qualdm1-%x-%j.out
#SBATCH --error=/gpfs01/home/mbxss28/slurm_err/qualidm1-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxss28@nottingham.ac.uk



source $HOME/.bash_profile

conda activate Qualimap

gtf=/gpfs01/home/mbxss28/DM/reference/gencode.v47.annotation.gtf

for i in $(ls *.sortedByCoord.out.bam | sed -r 's/[.]sortedByCoord.out.bam//' | uniq) ; do

qualimap bamqc -bam ${i}.sortedByCoord.out.bam --java-mem-size=10G -c

done
