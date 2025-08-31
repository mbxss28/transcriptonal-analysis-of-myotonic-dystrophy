#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=50
#SBATCH --mem=100g
#SBATCH --time=72:00:00
#SBATCH --job-name=STAR_paper3
#SBATCH --output=/gpfs01/home/mbxss28/slurm_output/STAR_paper3-%x-%j.out
#SBATCH --error=/gpfs01/home/mbxss28/slurm_err/STAR_paper3-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxss28@nottingham.ac.uk



source $HOME/.bash_profile

conda activate STAR

genomedir=/gpfs01/home/mbxss28/DM/paper1/STAR_index
output=/gpfs01/home/mbxss28/DM/paper3/fastp_files/output

for i in $(ls *_1*.fastq.gz | sed -r 's/_1[.]fastq.gz//' | uniq); do
STAR --runThreadN 16 \
     --genomeDir $genomedir \
     --readFilesIn ${i}_1.fastq.gz ${i}_2.fastq.gz \
     --readFilesCommand zcat \
     --outFilterType BySJout \
     --outFileNamePrefix $output/${i} \
     --outSAMtype BAM SortedByCoordinate
done
echo "finished mapping"
conda deactivate
