#!/bin/bash
#
# File:     install_fftw.sh
# Author:   Ben Lindsay
#
# Run this script from anywhere to install the FFTW library on the rrlogin
# cluster. Set "download_dir" and "install_dir" before running. The FFTW source
# code goes into the download_dir, and the library is installed to the
# install_dir. Usually it's something like "$HOME/local" or "$HOME/Install" .
# Also change "most_recent_fftw" if there's a more recent version.

# ================= Set these variables before running ====================== #
download_dir="$HOME/downloads"
install_dir="$HOME/local/fftw_mpi"
most_recent_fftw="fftw-3.3.4"
# compiler="icpc"         # For compiler icpc, I think only openmp works.
compiler="mpic++"     # For compiler mpic++, I think only mpi works.
enable_mpi=true
enable_openmp=false
# =========================================================================== #

# Make relevant directories if they aren't already made
mkdir -p "$download_dir"
mkdir -p "$install_dir"

# Download stuff
cd "$download_dir"
wget "http://www.fftw.org/$most_recent_fftw.tar.gz" # or most recent version
tar  -xzf  "$most_recent_fftw.tar.gz"
cd "$most_recent_fftw"

# Configure your configure command
command_str="./configure MPICC=$compiler --prefix=$install_dir"
if $enable_mpi; then
  command_str="$command_str --enable-mpi"
fi
if $enable_openmp; then
  command_str="$command_str --enable-openmp"
fi

# Execute your configure, make, and make install commands
echo "Configuring:"
echo "$command_str"
$command_str
make
make install

# Show what was just installed
# tree "$install_dir"

# Output should look like this for MPI:
# <install_dir>
# ├── bin
# │   ├── fftw-wisdom
# │   └── fftw-wisdom-to-conf
# ├── include
# │   ├── fftw3.f
# │   ├── fftw3.f03
# │   ├── fftw3.h
# │   ├── fftw3l.f03
# │   ├── fftw3l-mpi.f03
# │   ├── fftw3-mpi.f03
# │   ├── fftw3-mpi.h
# │   └── fftw3q.f03
# ├── lib
# │   ├── libfftw3.a
# │   ├── libfftw3.la
# │   ├── libfftw3_mpi.a
# │   ├── libfftw3_mpi.la
# │   └── pkgconfig
# │       └── fftw3.pc
# └── share
#     ├── info
#     │   ├── dir
#     │   ├── fftw3.info
#     │   ├── fftw3.info-1
#     │   └── fftw3.info-2
#     └── man
#         └── man1
#             ├── fftw-wisdom.1
#             └── fftw-wisdom-to-conf.1

# Or this for OpenMP:
# <install_dir>
# |-- bin
# |   |-- fftw-wisdom
# |   `-- fftw-wisdom-to-conf
# |-- include
# |   |-- fftw3.f
# |   |-- fftw3.f03
# |   |-- fftw3.h
# |   |-- fftw3l.f03
# |   `-- fftw3q.f03
# |-- lib
# |   |-- libfftw3.a
# |   |-- libfftw3.la
# |   |-- libfftw3_omp.a
# |   |-- libfftw3_omp.la
# |   `-- pkgconfig
# |       `-- fftw3.pc
# `-- share
#     |-- info
#     |   |-- fftw3.info
#     |   |-- fftw3.info-1
#     |   `-- fftw3.info-2
#     `-- man
#         `-- man1
#             |-- fftw-wisdom-to-conf.1
#             `-- fftw-wisdom.1
