# Tulip Benchmark

This repository contains the benchmark used in the paper's evaluation.

Under the directory [target](./targets), you will find the source code associated to each case of study of the paper.
For each target, there is a Makefile that let you to build it in three ways :
- Safe : The unbackdoored target, when the tool is tested with it, it should not find any backdoor.
- Backdoored : The backdoored target used in the evaluation, when the tool is tested with it, it may find the backdoor.
- Ground-truth : Hardened backdoored version that puts a marker in the traces when the backdoor is triggered.

In addition, each target comes with its README.md file, which describes the backdoor and how to trigger it.

The script [./build-minimal.sh](./build-minimal.sh) pemits to build a minimal version of the benchmark in a Docker image, with all of the required dependancies to build the targets.
