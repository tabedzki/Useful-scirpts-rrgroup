#!/bin/bash
echo $0
echo $shell
/bin/sed -r -e 's/\x0.*//' /proc/$$/cmdline
readlink /proc/$$/exe
# DIRECTORY=`dirname $0`

# sudo apt-get update
# sudo apt-get install libcr-dev mpich mpich-doc -y 
# sudo apt-get install gfortran gcc openmpi-bin openmpi-common openssh-client openssh-server libopenmpi-dev -y

# bash $DIRECTORY/install_fftw_mpi.sh

# bash $DIRECTORY/install_vim_plugins.sh

