# Federated Learning on Multimodal Sensor Data

UMass Amherst ECE535: Networked Embedded System Design Fall 2023

## Authors

- [@CDelSignore](https://www.github.com/CDelSignore) - Responsible for everything because it's a group of 1.

## Motivation

Machine learning has become an increasingly crucial skill in the embedded domain, which has not yet been reflected in the UMass curriculum. Having worked at a company that designs sensor systems for data logging, I am interested to explore federated learning and see if it might provide key advantages for such a system.

## Design Goals

* Implement per-class accuracy reporting
* Analyze the train and test data distribution
* Visualize and report findings

## Deliverables

* Understand multimodal federated learning
* Reproduce the results of the underlying research paper
* Perform per-class accuracy analysis and observe effect of skewed data distribution
* Evaluate the system on a multimodal dataset that is relatively balance in class distribution

## Requirements

* [IoT Dataset](https://drive.google.com/drive/folders/1rWJYkfMavGs1F-H0jykJ5V0fIiwrQdJV)
* Anaconda 3
* Python 3.7+
* Pytorch 1.8+
* Torchvision 0.9+
* Numpy 1.19+
* Matplotlib 3.3+
* Scipy 1.4+
* MPI for Python 3.0+

## System Blocks

![Multimodal Model](doc/multimodal-fed-model.jpg)

## Timeline

[09/26/23] - Project proposal  
[09/27/23] - Create repository  
[10/01/23] - Complete foundational research

Other timeframes to be decided when information posted to Moodle

## References

 - [Underlying Research Paper](https://arxiv.org/pdf/2109.04833.pdf)
 - [Underlying Code Repository](https://github.com/yuchenzhao/iotdi22-mmfl)
 - [Deep Learning Fundamentals](https://www.youtube.com/watch?v=gZmobeGL0Yg&list=PLZbbT5o_s2xq7LwI2y8_QtvuXZedL6tQU)
 - [PyTorch Fundamentals](https://www.youtube.com/watch?v=v5cngxo4mIg&list=PLZbbT5o_s2xrfNyHZsM6ufI0iZENK9xgG)
 - [Federated Learning Fundamentals](https://www.youtube.com/watch?v=X8YYWunttOY)
 - [Federated Learning Research](http://proceedings.mlr.press/v54/mcmahan17a/mcmahan17a.pdf)
