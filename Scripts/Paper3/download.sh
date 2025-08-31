#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=50
#SBATCH --mem=100g
#SBATCH --time=48:00:00
#SBATCH --job-name=p1download
#SBATCH --output=/gpfs01/home/mbxss28/slurm_output/download_p1-%x-%j.out
#SBATCH --error=/gpfs01/home/mbxss28/slurm_err/download_p1-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxss28@nottingham.ac.uk

source $HOME/.bash_profile
conda activate SRA

#unaffected control

fastq-dump --gzip --split-files SRR24003378

fastq-dump --gzip --split-files SRR24003382

fastq-dump --gzip --split-files SRR24003383

fastq-dump --gzip --split-files SRR24003384

fastq-dump --gzip --split-files SRR24003385

fastq-dump --gzip --split-files SRR24003386

fastq-dump --gzip --split-files SRR24003387

fastq-dump --gzip --split-files SRR24003388

fastq-dump --gzip --split-files SRR24003389

fastq-dump --gzip --split-files SRR24003390


#DM1 

fastq-dump --gzip --split-files SRR24003377

fastq-dump --gzip --split-files SRR24003379

fastq-dump --gzip --split-files SRR24003380

fastq-dump --gzip --split-files SRR24003381

fastq-dump --gzip --split-files SRR24003391

fastq-dump --gzip --split-files SRR24003392

fastq-dump --gzip --split-files SRR24003393

