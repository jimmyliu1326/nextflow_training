# CIDGOH Nextflow Training

This repository serves as an archive for the training materials that were developed to acquaint new trainees with the fundamentals of Nextflow pipeline development.

**Topics covered:**

- Channels, proccesses and workflows
- Operators
- Running Nextflow pipelines via CLI
- Hierarchical structure of a typical Nextflow pipeline repo
- NF-CORE template, community and guidelines

## Running the tutorial
This tutorial is powered by **GitHub Codespace** to provision a common environment for all trainees (or anyone) to follow along and collaborate. The environment is pre-installed with Nextflow, Conda and VSCode, providing the necessary means to test out example workflows, as well as the workflows developed by the trainees themselves.

Navigate to this link to launch the environment: https://github.com/codespaces/new/jimmyliu1326/nextflow_training?quickstart=1

## Integrated activity
For this section, trainees are tasked with building a simple microbial genomics pipeline to predict *Salmonella* serovars from nanopore long-read sequencing data. Using the provided nf-core modules, you are expected to construct a workflow according to the following diagram:

![diagram](https://github.com/jimmyliu1326/nextflow_training/blob/main/img/activity_flowchart.png?raw=true)

To get started, an initial workflow template has been set up for you at [main.nf](./main.nf).

## Further learning

Seqera training workshops: <https://training.nextflow.io/latest/>
Carpentries nextflow tutorial: <https://carpentries-incubator.github.io/workflows-nextflow/>

## Acknowledgement
This tutorial was co-developed by Jimmy Liu, Marcus Yee and Miguel Prieto