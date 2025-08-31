#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --mem=100g
#SBATCH --time=72:00:00
#SBATCH --job-name=convert
#SBATCH --output=/gpfs01/home/mbxss28/slurm_output/convert-%x-%j.out
#SBATCH --error=/gpfs01/home/mbxss28/slurm_err/convert-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxss28@nottingham.ac.uk



source $HOME/.bash_profile

conda activate agat

agat_convert_sp_gxf2gxf.pl -g gencode.v47.annotation.gtf -o gencode.gff3
