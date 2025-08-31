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
#SBATCH --mail-user=mbxss28@nottingham.ac.uk

source $HOME/.bash_profile
conda activate SRA

#download uaffected samples 
fastq-dump --gzip --split-files SRR12582152

fastq-dump --gzip --split-files SRR12582151

fastq-dump --gzip --split-files SRR12582150

fastq-dump --gzip --split-files SRR12582149

fastq-dump --gzip --split-files SRR12582148

fastq-dump --gzip --split-files SRR12582147

fastq-dump --gzip --split-files SRR12582146

fastq-dump --gzip --split-files SRR12582145



#download DM1 samples 

fastq-dump --gzip --split-files SRR12582120

fastq-dump --gzip --split-files SRR12582121

fastq-dump --gzip --split-files SRR12582122

fastq-dump --gzip --split-files SRR12582123

fastq-dump --gzip --split-files SRR12582124

fastq-dump --gzip --split-files SRR12582125

fastq-dump --gzip --split-files SRR12582126

fastq-dump --gzip --split-files SRR12582127

fastq-dump --gzip --split-files SRR12582128

fastq-dump --gzip --split-files SRR12582129

fastq-dump --gzip --split-files SRR12582130

fastq-dump --gzip --split-files SRR12582131

fastq-dump --gzip --split-files SRR12582132

fastq-dump --gzip --split-files SRR12582133

fastq-dump --gzip --split-files SRR12582134

fastq-dump --gzip --split-files SRR12582135

fastq-dump --gzip --split-files SRR12582136

fastq-dump --gzip --split-files SRR12582137

fastq-dump --gzip --split-files SRR12582138

fastq-dump --gzip --split-files SRR12582139

fastq-dump --gzip --split-files SRR12582140

conda deactivate


