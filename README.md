This repository contains the experimental code and data for the paper: [Learning logic programs through divide, constrain, and conquer](https://arxiv.org/pdf/2109.07818.pdf) from AAAI 2022.

This version of the DCC algorithm is poorly engineered and inefficient. If you want to use DCC, please use the latest version that has been merged into the main [Popper](https://github.com/logic-and-learning-lab/Popper) repository.



## Requirements

[SWI-Prolog](https://www.swi-prolog.org)

[Clingo 5.5.0](https://potassco.org/clingo/)

[pyswip](https://pypi.org/project/pyswip/)


## Usage

You can reproduce the plots with the command: `python benchmark.py results`

You can run the tests again with the command: `python benchmark.py test`

You can run the learning again with the command: `python benchmark.py train`. Note that this step will take a long time. You can reduce the time by running the experiments in parallel. You can change the number of cores (default 1) in the benchmark.py file.
