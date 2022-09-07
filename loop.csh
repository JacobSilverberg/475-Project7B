#!/bin/bash
module load openmpi/3.1
# mpic++ mpi.cpp -o mpi -lm
mpiexec -mca btl self,tcp -np 4 mpi