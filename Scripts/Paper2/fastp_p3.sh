#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --mem=100g
#SBATCH --time=48:00:00
#SBATCH --job-name=paper3fastp
#SBATCH --output=/gpfs01/home/mbxss28/slurm_output/fastqp3-%x-%j.out
#SBATCH --error=/gpfs01/home/mbxss28/slurm_err/fastqp3-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxss28@nottingham.ac.uk



source $HOME/.bash_profile

conda activate Fastp

#Do analysis seperatly for each sample to make sure that pairs are correctly paried with eachother.

output=/gpfs01/home/mbxss28/DM/paper3/fastp_files
QC=/gpfs01/home/mbxss28/DM/paper3/QC

#c9ALS
fastp -i SRR1927020_1.fastq.gz -I SRR1927020_2.fastq.gz -o $output/p3_20_1.fastq.gz -O $output/p3_20_2.fastq.gz --html $QC/p3fastp_20.html -w 16

fastp -i SRR1927022_1.fastq.gz -I SRR1927022_2.fastq.gz -o $output/p3_22_1.fastq.gz -O $output/p3_22_2.fastq.gz --html $QC/p3fastp_22.html -w 16

fastp -i SRR1927024_1.fastq.gz -I SRR1927024_2.fastq.gz -o $output/p3_24_1.fastq.gz -O $output/p3_24_2.fastq.gz --html $QC/p3fastp_24.html -w 16

fastp -i SRR1927026_1.fastq.gz -I SRR1927026_2.fastq.gz -o $output/p3_26_1.fastq.gz -O $output/p3_26_2.fastq.gz --html $QC/p3fastp_26.html -w 16

fastp -i SRR1927028_1.fastq.gz -I SRR1927028_2.fastq.gz -o $output/p3_28_1.fastq.gz -O $output/p3_28_2.fastq.gz --html $QC/p3fastp_28.html -w 16

fastp -i SRR1927030_1.fastq.gz -I SRR1927030_2.fastq.gz -o $output/p3_30_1.fastq.gz -O $output/p3_30_2.fastq.gz --html $QC/p3fastp_30.html -w 16

fastp -i SRR1927032_1.fastq.gz -I SRR1927032_2.fastq.gz -o $output/p3_32_1.fastq.gz -O $output/p3_32_2.fastq.gz --html $QC/p3fastp_32.html -w 16

fastp -i SRR1927034_1.fastq.gz -I SRR1927034_2.fastq.gz -o $output/p3_34_1.fastq.gz -O $output/p3_34_2.fastq.gz --html $QC/p3fastp_34.html -w 16


#Control

fastp -i SRR1927056_1.fastq.gz -I SRR1927056_2.fastq.gz -o $output/p3_56_1.fastq.gz -O $output/p3_56_2.fastq.gz --html $QC/p3fastp_56.html -w 16

fastp -i SRR1927058_1.fastq.gz -I SRR1927058_2.fastq.gz -o $output/p3_58_1.fastq.gz -O $output/p3_58_2.fastq.gz --html $QC/p3fastp_58.html -w 16

fastp -i SRR1927060_1.fastq.gz -I SRR1927060_2.fastq.gz -o $output/p3_60_1.fastq.gz -O $output/p3_60_2.fastq.gz --html $QC/p3fastp_60.html -w 16

fastp -i SRR1927062_1.fastq.gz -I SRR1927062_2.fastq.gz -o $output/p3_62_1.fastq.gz -O $output/p3_62_2.fastq.gz --html $QC/p3fastp_62.html -w 16

fastp -i SRR1927064_1.fastq.gz -I SRR1927064_2.fastq.gz -o $output/p3_64_1.fastq.gz -O $output/p3_64_2.fastq.gz --html $QC/p3fastp_64.html -w 16

fastp -i SRR1927066_1.fastq.gz -I SRR1927066_2.fastq.gz -o $output/p3_66_1.fastq.gz -O $output/p3_66_2.fastq.gz --html $QC/p3fastp_66.html -w 16

fastp -i SRR1927068_1.fastq.gz -I SRR1927068_2.fastq.gz -o $output/p3_68_1.fastq.gz -O $output/p3_68_2.fastq.gz --html $QC/p3fastp_68.html -w 16
