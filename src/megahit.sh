#!/bin/bash -l
#SBATCH -n 24
#SBATCH -N 1
#SBATCH --time=3-23:00:00
#SBATCH -J Megahit		#Job Name
#SBATCH -o Megahit.%A.out
#SBATCH -e Megahit.%A.err
#SBATCH --mem=250g

conda activate local


R1=`ls /proj/marchlab/projects/EXPORTS/metagenomics/Tara-test/trim/*_paired_1.fastq`
R2=`ls /proj/marchlab/projects/EXPORTS/metagenomics/Tara-test/trim/*_paired_2.fastq`

for i in $R1
do
all_R1=${all_R1},$i
done

all_R1=`echo ${all_R1}|cut -d, -f2-`
echo ${all_R1}

for i in $R2 
do
all_R2=${all_R2},$i
done

all_R2=`echo ${all_R2}|cut -d, -f2-`
echo ${all_R2}

megahit -t 24 -1 ${all_R1} -2 ${all_R2} -o /proj/marchlab/projects/EXPORTS/metagenomics/Tara-test/assembly/megahit
