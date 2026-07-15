#!/bin/bash
# This scripts build the Singularity container for LSU/LONI HPC
# Author:       Dr. Jason Li (jasonli3@lsu.edu)
# Requirements: 500 GB hard drive (prefer SSD)
# Usage:        ./build_singularity.sh [/path/to/singularity/image]


VERSION=3.0.3

# 1. Build official Docker container
docker build -t jasonli3/alphafold3:$VERSION -f docker/Dockerfile .

# 2. Build Singularity container
singularity build ${1:-$HOME/alphafold3-$VERSION.sif} docker/singularity.def

