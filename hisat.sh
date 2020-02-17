#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=2
#SBATCH --time=2:00:00
#SBATCH --mem=4GB
#SBATCH --job-name=Homework01
#SBATCH --output=slurm_%j.out

ln -s /scratch/work/jupyterhub/2020-SP-BIOL-GA.1130-001/class_share/homework02/* ./
module load hisat2/intel/2.0.5
hisat2-build ./*.fa Arabidopsis_index
for read in ./*_1.fastq
do
  	hisat2  -p 8 -x  ./Arabidopsis_index -1 $read -2 ${read::-7}2.fastq > ${read::-7}Arabidopsisi_HiSAT.sam
done

