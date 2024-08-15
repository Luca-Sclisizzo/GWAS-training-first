I want to try to learn a bit of Biodata analisys, in particular GWAS. In this repository I will upload the scripts.
All the work is performed on LINUX machine.

Contents of the scripts:
1. "Script1_QC_finito.sh": it's the script to perform the Quality Check on the SNPs
2. "Script2_PCA.sh": it's the script to perfotm the PCA on the samples
3. "population_info.txt": this is the txt file that contains the information of the samples' population
4. "PCA-plot": this is the python script to plot the PCA
5. "Phasing.py": this is the script to compute phasing with eagle
6. "GWAS_regression": it'a a small script to compute the linear logistic regression with a binary phenotype and PCA scorea as covariate
7. "Manhattan_plot": it'a a pyhton script to show (and #save) the Manhattan plot. It uses gwaslab library. Here for more details on the visualisation options (https://github.com/Cloufield/gwaslab/blob/main/docs/Visualization.md#28-highlight-specified-loci
