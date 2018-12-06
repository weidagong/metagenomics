#!/bin/bash -l
#SBATCH -n 16
#SBATCH -N 1
#SBATCH --time=3-23:00:00
#SBATCH -J Quast		#Job Name
#SBATCH -o Quast.%A.out
#SBATCH -e Quast.%A.err
#SBATCH --mem=10g

conda activate local


cd /proj/marchlab/projects/EXPORTS/metagenomics/Tara-test/assembly_evaluation

#$1 is contig file
#$2 is output report file

#-e for eukaryote
#--mgm to use metagenemark for gene finding
#use quast here because metaquast requires reference genomes
#only compute basic metrics

quast.py $1 -t 16 -e --gene-finding -o $2
