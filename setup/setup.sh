#!/bin/bash

# Install Miniconda if needed
if [ -z "$(which conda)" ]; then
    mkdir -p ~/miniconda3
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
    bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
    rm -rf ~/miniconda3/miniconda.sh
    conda init bash
    conda init zsh 
    conda config --set auto_activate_base false
fi

# Install dependencies in a "deep-learning" conda env
conda update -n base conda
conda install -n base conda-libmamba-solver
conda config --set solver libmamba
if [ -z "$(conda env list | grep deep-learning)" ]; then conda env create --name deep-learning --file ./setup/environment.yml; fi

# Extract preprocessed data
mkdir -p ./data
tar -xzf mhealth.tar.gz -C ./data/
tar -xzf opp.tar.gz -C ./data/
tar -xzf ur_fall.tar.gz -C ./data/