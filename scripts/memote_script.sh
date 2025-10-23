#!/bin/bash -l

#SBATCH --job-name=memote_2
#SBATCH --output=/scratch/prj/cmm_ipsc_transcriptomics/scratch_tmp/Plasmax_GEM/Human-GEM/memote_output.log
#SBATCH --error=/scratch/prj/cmm_ipsc_transcriptomics/scratch_tmp/Plasmax_GEM/Human-GEM/memote_error.log
#SBATCH --partition=cpu
#SBATCH --ntasks=1
#SBATCH --mem=1000G
#SBATCH --signal=USR2
#SBATCH --cpus-per-task=2
#SBATCH --export=ALL

#load in anaconda
module load anaconda3/2022.10-gcc-13.2.0

# Initialize conda (fixes the activation issue prev)
eval "$(conda shell.bash hook)"

# activate conda environment
conda activate /scratch/prj/cmm_ipsc_transcriptomics/scratch_tmp/Plasmax_GEM/envs/memote_env

#run script
memote report snapshot --filename "post-MAR12372_report.html" Human-GEM/model/Human-GEM_mod.xml
echo "Job completed!"
