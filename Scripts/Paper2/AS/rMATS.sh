#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --mem=100g
#SBATCH --time=72:00:00
#SBATCH --job-name=rmats_p3_f
#SBATCH --output=/gpfs01/home/mbxss28/slurm_output/rmats_p3_f-%x-%j.out
#SBATCH --error=/gpfs01/home/mbxss28/slurm_err/rmats_p3_f-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxss28@nottingham.ac.uk

source $HOME/.bash_profile

conda activate rMATS

gtf=/gpfs01/home/mbxss28/DM/reference/gencode.v47.annotation.gtf

output=/gpfs01/home/mbxss28/DM/paper3/fastp_files/output/rMATS_f/results

tmp=/gpfs01/home/mbxss28/DM/paper3/fastp_files/output/rMATS_f/tmp

python /gpfs01/home/mbxss28/miniconda3/envs/rMATS/rMATS/rmats.py --b1 C9ALS.txt --b2 Control.txt --gtf $gtf -t paired --allow-clipping --readLength 99 --variable-read-length --nthread 30 --od $output --tmp $tmp
conda deactivate
