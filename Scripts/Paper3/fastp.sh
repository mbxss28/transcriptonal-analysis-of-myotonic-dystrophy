#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=60
#SBATCH --mem=100g
#SBATCH --time=48:00:00
#SBATCH --job-name=paper4fastp
#SBATCH --output=/gpfs01/home/mbxss28/slurm_output/fastqp4-%x-%j.out
#SBATCH --error=/gpfs01/home/mbxss28/slurm_err/fastqp4-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxss28@nottingham.ac.uk



source $HOME/.bash_profile

conda activate Fastp

#Do analysis seperatly for each sample to make sure that pairs are correctly paried with eachother.

fastp -i SRR24003377_1.fastq.gz -I SRR24003377_2.fastq.gz -o p4_77_1.fastq.gz -O p4_77_2.fastq.gz --html p4fastp_77.html -w 16

fastp -i SRR24003378_1.fastq.gz -I SRR24003378_2.fastq.gz -o p4_78_1.fastq.gz -O p4_78_2.fastq.gz --html p4fastp_78.html -w 16

fastp -i SRR24003379_1.fastq.gz -I SRR24003379_2.fastq.gz -o p4_79_1.fastq.gz -O p4_79_2.fastq.gz --html p4fastp_79.html -w 16

fastp -i SRR24003380_1.fastq.gz -I SRR24003380_2.fastq.gz -o p4_80_1.fastq.gz -O p4_80_2.fastq.gz --html p4fastp_80.html -w 16

fastp -i SRR24003381_1.fastq.gz -I SRR24003381_2.fastq.gz -o p4_81_1.fastq.gz -O p4_81_2.fastq.gz --html p4fastp_81.html -w 16

fastp -i SRR24003382_1.fastq.gz -I SRR24003382_2.fastq.gz -o p4_82_1.fastq.gz -O p4_82_2.fastq.gz --html p4fastp_82.html -w 16

fastp -i SRR24003383_1.fastq.gz -I SRR24003383_2.fastq.gz -o p4_83_1.fastq.gz -O p4_83_2.fastq.gz --html p4fastp_83.html -w 16

fastp -i SRR24003384_1.fastq.gz -I SRR24003384_2.fastq.gz -o p4_84_1.fastq.gz -O p4_84_2.fastq.gz --html p4fastp_84.html -w 16

fastp -i SRR24003385_1.fastq.gz -I SRR24003385_2.fastq.gz -o p4_85_1.fastq.gz -O p4_85_2.fastq.gz --html p4fastp_85.html -w 16

fastp -i SRR24003386_1.fastq.gz -I SRR24003386_2.fastq.gz -o p4_86_1.fastq.gz -O p4_86_2.fastq.gz --html p4fastp_86.html -w 16

fastp -i SRR24003387_1.fastq.gz -I SRR24003387_2.fastq.gz -o p4_87_1.fastq.gz -O p4_87_2.fastq.gz --html p4fastp_87.html -w 16

fastp -i SRR24003388_1.fastq.gz -I SRR24003388_2.fastq.gz -o p4_88_1.fastq.gz -O p4_88_2.fastq.gz --html p4fastp_88.html -w 16

fastp -i SRR24003389_1.fastq.gz -I SRR24003389_2.fastq.gz -o p4_89_1.fastq.gz -O p4_89_2.fastq.gz --html p4fastp_89.html -w 16

fastp -i SRR24003390_1.fastq.gz -I SRR24003390_2.fastq.gz -o p4_90_1.fastq.gz -O p4_90_2.fastq.gz --html p4fastp_90.html -w 16

fastp -i SRR24003391_1.fastq.gz -I SRR24003391_2.fastq.gz -o p4_91_1.fastq.gz -O p4_91_2.fastq.gz --html p4fastp_91.html -w 16

fastp -i SRR24003392_1.fastq.gz -I SRR24003392_2.fastq.gz -o p4_92_1.fastq.gz -O p4_92_2.fastq.gz --html p4fastp_92.html -w 16

fastp -i SRR24003393_1.fastq.gz -I SRR24003393_2.fastq.gz -o p4_93_1.fastq.gz -O p4_93_2.fastq.gz --html p4fastp_93.html -w 16
