# Federated Learning on Multimodal Sensor Data

UMass Amherst ECE535: Networked Embedded System Design Fall 2023. This is an implementation of the federated learning model from the paper [Multimodal Federated Learning on IoT Data](https://arxiv.org/pdf/2109.04833.pdf) that reports per-class testing and training accuracies. This project is cloned from the original [code repository](https://github.com/yuchenzhao/iotdi22-mmfl) for this paper.

## Authors

- [@CDelSignore](https://www.github.com/CDelSignore) is responsible for the implementtation details
- [@JulianCDay](https://github.com/JulianCDay) is responsible for the analysis of the collected data

## Directory Structure

* *setup*: setup scripts and pre-processed data archives
* *doc*: project documentation
* *config*: configuration files for experiments
* *data*: pre-processed data
* *plots*: visualizations of results
* *results*: comma-delimited experimental results
* *src*: source code
* *sub* pbs files for job submissions to clusters


## Requirements

The requirements, including a minimal installation of [Miniconda](https://docs.conda.io/projects/miniconda/en/latest/index.html) are automatically fulfilled by running `/setup/setup.sh`. Alternatively the following packages can be installed on Python 3.7+
* Pytorch 1.8+
* Torchvision 0.9+
* Numpy 1.19+
* Matplotlib 3.3+
* Scipy 1.4+
* MPI for Python 3.0+

## Setup
The following instructions assume a Linux installation. The project will run on other platforms, but these are left as an exercise to the reader. The majority of this project was completed using Windows Subsystem Linux (WSL).

1.  Clone  this repository
    ```bash 
    $ git clone git@github.com:CDelSignore/federated-learning-multimodal.git
    ```

2. Run the installation script which will download the latest version of Miniconda and install the listed dependencies in an environment named "deep-learning." It will also extract all the pre-processed data.
    ```bash
    $ ./config/setup.sh
    ```

3. Activate the newly created conda environment.
    ```bash
    $ conda activate deep-learning
    ```

## (Optional) Generating Pre-Processed Data
1. This repository includes pre-processed data from the Opp, mHealth, and UR Fall datasets. If you wish to generate your own instead of using the included files, you can do so.

    * Opp: Extract [the dataset](http://www.opportunity-project.eu/system/files/Challenge/OpportunityChallengeLabeled.zip) and place all `.dat` files in a folder `/data/opp/`.
    * mHealth: Extract [the dataset](https://archive.ics.uci.edu/ml/machine-learning-databases/00319/MHEALTHDATASET.zip) and place all `.log` files in `/data/mhealth/`
    * UR Fall: Uncomment ```# download_UR_fall()``` in `src/utils.py`

2. At the end of the `/src/utils.py` file uncomment the corresponding `gen_xyz("data")` lines for the datasets you wish to generate. 

3. Run the program **from the parent directory**:
    ```bash
    python src/utils.py
    ```

4. There should be a `xyz.mat` file in the associated `/data/<xyz>/` folder.

## Configuring and Running Experiments

1. The `/config/` directory holds configuration files, each of which specifies the parameters for that run. The `/setup/config_example` file explains in detail how to properly configure an experiment.

2. By default, all config files in the `/config/` directory are run at once. Always run the program **from the parent directory**. This will take a long time if there are a lot of config files.
    ```bash
    python src/main.py
    ```

3. Each experiment will result in three files in a corresponding filepath within `/results/`. These files are:
    * `perclass_train.txt` : [round, correct, total, accuracy] for training data
    * `perclass_test.txt` : [round, correct, total, accuracy] for testing data
    * `results.txt` : [round, local_ae_loss, train_loss, train_accuracy, test_loss, test_f1] overall

## (TODO) Clustering
The original repository allowed for running groups of experiments on clusters. This functionality is not implemented with the changes on this implementation, but may be restored at a later date. See the original repository if this is a critical feature.

## Analysis

1. After running experiments, run the analysis script *from the parent directory*:
    ```bash
    python src/analysis.py
    ```

2. This will produce 4-subplot figures in a corresponding directory in `/plots/` with the per-class and overall data visualized.

3. If you wish the replicate the visualizations from the original research paper, uncomment `#single_multi_modality_comparison()` and `#cross_modality_comparison()` in the script. Make sure you have run ALL the experiments before doing so.