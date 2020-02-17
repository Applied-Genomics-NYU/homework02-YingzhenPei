#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=2
#SBATCH --time=2:00:00
#SBATCH --mem=4GB
#SBATCH --job-name=Homework01
#SBATCH --output=slurm_%j.out

module load samtools/intel/1.9
for read in ./*.sam
do
	samtools flagstat ./$read
	samtools view -bS $read > ${read::-3}bam
	samtools sort ${read::-3}bam -o ${read::-4}.sorted.bam
done
