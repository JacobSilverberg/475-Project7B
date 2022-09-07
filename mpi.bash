#!/bin/bash
#SBATCH  -J  Proj7b_silverbj
#SBATCH  -A  cs475-575
#SBATCH  -p  class
#SBATCH  -N 4      # number of nodes
#SBATCH  -n 4      # number of tasks
#SBATCH --constraint=ib
#SBATCH  -o  mpi.out
#SBATCH  -e  mpi.err
#SBATCH  --mail-type=END,FAIL
#SBATCH  --mail-user=silverbj@oregonstate.edu
mpic++ mpi.cpp -o mpi -lm
mpiexec -mca btl self,tcp -np 4 mpi