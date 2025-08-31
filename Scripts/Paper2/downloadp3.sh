#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=30
#SBATCH --mem=100g
#SBATCH --time=48:00:00
#SBATCH --job-name=paper3download
#SBATCH --output=/gpfs01/home/mbxss28/slurm_output/download_p3-%x-%j.out
#SBATCH --error=/gpfs01/home/mbxss28/slurm_err/download_p3-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxss28@nottingham.ac.uk

source $HOME/.bash_profile
conda activate SRA

#download ALS c9 samples
fastq-dump --gzip --split-files SRR1927020

fastq-dump --gzip --split-files SRR1927022

fastq-dump --gzip --split-files SRR1927024

fastq-dump --gzip --split-files SRR1927026

fastq-dump --gzip --split-files SRR1927028

fastq-dump --gzip --split-files SRR1927030

fastq-dump --gzip --split-files SRR1927032

fastq-dump --gzip --split-files SRR1927034


#download healthy control samples
fastq-dump --gzip --split-files SRR1927056

fastq-dump --gzip --split-files SRR1927058

fastq-dump --gzip --split-files SRR1927060

fastq-dump --gzip --split-files SRR1927062

fastq-dump --gzip --split-files SRR1927064

fastq-dump --gzip --split-files SRR1927066

fastq-dump --gzip --split-files SRR1927068
