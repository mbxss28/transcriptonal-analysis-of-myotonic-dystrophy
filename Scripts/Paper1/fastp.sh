#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --mem=100g
#SBATCH --time=48:00:00
#SBATCH --job-name=paper1fastp
#SBATCH --output=/gpfs01/home/mbxss28/slurm_output/fastqp1-%x-%j.out
#SBATCH --error=/gpfs01/home/mbxss28/slurm_err/fastqp1-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxss28@nottingham.ac.uk



source $HOME/.bash_profile

conda activate Fastp

echo "DM samples"
#Do analysis seperatly for each sample to make sure that pairs are correctly paried with eachother.

fastp -i SRR12582120_1.fastq.gz -I SRR12582120_2.fastq.gz -o p1_20_1.fastq.gz -O p1_20_2.fastq.gz --html p1fastp_20.html -w 16

fastp -i SRR12582121_1.fastq.gz -I SRR12582121_2.fastq.gz -o p1_21_1.fastq.gz -O p1_21_2.fastq.gz --html p1fastp_21.html -w 16

fastp -i SRR12582122_1.fastq.gz -I SRR12582122_2.fastq.gz -o p1_22_1.fastq.gz -O p1_22_2.fastq.gz --html p1fastp_22.html -w 16

fastp -i SRR12582123_1.fastq.gz -I SRR12582123_2.fastq.gz -o p1_23_1.fastq.gz -O p1_23_2.fastq.gz --html p1fastp_23.html -w 16

fastp -i SRR12582124_1.fastq.gz -I SRR12582124_2.fastq.gz -o p1_24_1.fastq.gz -O p1_24_2.fastq.gz --html p1fastp_24.html -w 16

fastp -i SRR12582125_1.fastq.gz -I SRR12582125_2.fastq.gz -o p1_25_1.fastq.gz -O p1_25_2.fastq.gz --html p1fastp_25.html -w 16

fastp -i SRR12582126_1.fastq.gz -I SRR12582126_2.fastq.gz -o p1_26_1.fastq.gz -O p1_26_2.fastq.gz --html p1_fastp_26.html -w 16

fastp -i SRR12582127_1.fastq.gz -I SRR12582127_2.fastq.gz -o p1_27_1.fastq.gz -O p1_27_2.fastq.gz --html p1_fastp_27.html -w 16

fastp -i SRR12582128_1.fastq.gz -I SRR12582128_2.fastq.gz -o p1_28_1.fastq.gz -O p1_28_2.fastq.gz --html p1fastp_28.html -w 16

fastp -i SRR12582129_1.fastq.gz -I SRR12582129_2.fastq.gz -o p1_29_1.fastq.gz -O p1_29_2.fastq.gz --html p1fastp_29.html -w 16

fastp -i SRR12582130_1.fastq.gz -I SRR12582130_2.fastq.gz -o p1_30_1.fastq.gz -O p1_30_2.fastq.gz --html p1fastp_30.html -w 16

fastp -i SRR12582131_1.fastq.gz -I SRR12582131_2.fastq.gz -o p1_31_1.fastq.gz -O p1_31_2.fastq.gz --html p1fastp_31.html -w 16

fastp -i SRR12582132_1.fastq.gz -I SRR12582132_2.fastq.gz -o p1_32_1.fastq.gz -O p1_32_2.fastq.gz --html p1fastp_32.html -w 16

fastp -i SRR12582133_1.fastq.gz -I SRR12582133_2.fastq.gz -o p1_33_1.fastq.gz -O p1_33_2.fastq.gz --html p1fastp_33.html -w 16

fastp -i SRR12582134_1.fastq.gz -I SRR12582134_2.fastq.gz -o p1_34_1.fastq.gz -O p1_34_2.fastq.gz --html p1fastp_34.html -w 16

fastp -i SRR12582135_1.fastq.gz -I SRR12582135_2.fastq.gz -o p1_35_1.fastq.gz -O p1_35_2.fastq.gz --html p1fastp_35.html -w 16

fastp -i SRR12582136_1.fastq.gz -I SRR12582136_2.fastq.gz -o p1_36_1.fastq.gz -O p1_36_2.fastq.gz --html p1fastp_36.html -w 16

fastp -i SRR12582137_1.fastq.gz -I SRR12582137_2.fastq.gz -o p1_37_1.fastq.gz -O p1_37_2.fastq.gz --html p1fastp_37.html -w 16

fastp -i SRR12582137_1.fastq.gz -I SRR12582137_2.fastq.gz -o p1_37_1.fastq.gz -O p1_37_2.fastq.gz --html p1fastp_37.html -w 16

fastp -i SRR12582138_1.fastq.gz -I SRR12582138_2.fastq.gz -o p1_38_1.fastq.gz -O p1_38_2.fastq.gz --html p1fastp_38.html -w 16

fastp -i SRR12582139_1.fastq.gz -I SRR12582139_2.fastq.gz -o p1_39_1.fastq.gz -O p1_39_2.fastq.gz --html p1fastp_39.html -w 16

fastp -i SRR12582140_1.fastq.gz -I SRR12582140_2.fastq.gz -o p1_40_1.fastq.gz -O p1_40_2.fastq.gz --html p1fastp_40.html -w 16

echo "Unaffected samples"

fastp -i SRR12582145_1.fastq.gz -I SRR12582145_2.fastq.gz -o p1_45_1.fastq.gz -O p1_45_2.fastq.gz --html p1fastp_45.html -w 16

fastp -i SRR12582146_1.fastq.gz -I SRR12582146_2.fastq.gz -o p1_46_1.fastq.gz -O p1_46_2.fastq.gz --html p1fastp_46.html -w 16

fastp -i SRR12582147_1.fastq.gz -I SRR12582147_2.fastq.gz -o p1_47_1.fastq.gz -O p1_47_2.fastq.gz --html p1fastp_47.html -w 16

fastp -i SRR12582148_1.fastq.gz -I SRR12582148_2.fastq.gz -o p1_48_1.fastq.gz -O p1_48_2.fastq.gz --html p1fastp_48.html -w 16

fastp -i SRR12582149_1.fastq.gz -I SRR12582149_2.fastq.gz -o p1_49_1.fastq.gz -O p1_49_2.fastq.gz --html p1fastp_49.html -w 16

fastp -i SRR12582150_1.fastq.gz -I SRR12582150_2.fastq.gz -o p1_50_1.fastq.gz -O p1_50_2.fastq.gz --html p1fastp_50.html -w 16

fastp -i SRR12582151_1.fastq.gz -I SRR12582151_2.fastq.gz -o p1_51_1.fastq.gz -O p1_51_2.fastq.gz --html p1fastp_51.html -w 16
