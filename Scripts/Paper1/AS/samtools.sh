#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --mem=100g
#SBATCH --time=72:00:00
#SBATCH --job-name=p1samtools
#SBATCH --output=/gpfs01/home/mbxss28/slurm_output/p1samtools-%x-%j.out
#SBATCH --error=/gpfs01/home/mbxss28/slurm_err/p1samtools-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxss28@nottingham.ac.uk



source $HOME/.bash_profile

conda activate Samtool

for i in $(ls *.sortedByCoord.out.bam | sed -r 's/[.]sortedByCoord.out.bam//' | uniq) ; do 

samtools flagstat  $i.sortedByCoord.out.bam > /gpfs01/home/mbxss28/DM/paper1/fastp/fastq/DM/output/${i}_quality.txt

conda deactivate
