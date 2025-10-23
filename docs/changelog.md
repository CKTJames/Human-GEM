## Background - 22/10/25

Human-GEM v1.19.0 is not stoichiometrically consistent (github issue #837), is missing some pathways, and some metabolites/reactions are in the wrong compartments. 
I am only planning on implementing changes already identified by the Human-GEM maintainers, and will link to each issue/solution. This will also be limited to FASII and maintaining stoichiometric consistency.

## Setup

Clone the Human-GEM repository into local directory, and copy so that I have a modifiable local copy and the original 

``` 
git clone https://github.com/SysBioChalmers/Human-GEM.git

```

Create a conda environment to run memote in: 

```
conda create -p path/to/envs/myenv python=3.11 -c bioconda

conda activate myenv

pip install memote
```
 
## Running memote

On a compute node, run the following: 

```
memote report snapshot --filename "base_report.html" Human-GEM/model/Human-GEM.xml
```

## fix_stoichiometry ef4f2f8 23.10.25

Used script mod_MAR12372.m to modify Human-GEM in line with issue #837 and #813. 
Saved modified model as Human-GEM_mod.mat

Next step is to run memote to check if stoichiometry is fixed here
