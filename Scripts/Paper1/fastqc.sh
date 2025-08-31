#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --mem=100g
#SBATCH --time=48:00:00
#SBATCH --job-name=paper1fastqc
#SBATCH --output=/gpfs01/home/mbxss28/slurm_output/fastqcp1-%x-%j.out
#SBATCH --error=/gpfs01/home/mbxss28/slurm_err/fastqcp1-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxss28@nottingham.ac.uk



source $HOME/.bash_profile

conda activate Fastqc

echo "Start first end"

for i in $(ls SRR*_1.fastq.gz);do
 fastqc -o QC_1 -f fastq $i
done
echo "First end complete"

echo "Start second end"
for n in $(ls SRR*_2.fastq.gz);do
 fastqc -o QC_2 -f fastq $n
done
echo "Second strand complete"
echo "Finished Analysis"
conda deactivate
