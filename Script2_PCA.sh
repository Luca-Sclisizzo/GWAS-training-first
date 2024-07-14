# In this script I will compute PCA

#!/bin/bash

#I have to make the set of high LD
plink1 \
	--bfile sample_data.clean \
	--make-set high-ld.txt \
	--write-set \
	--out highld_set

#I have to prune for MAF, LD and relatives samples
plink2 \
	--bfile sample_data.clean \
	--alleleACGT \
	--maf 0.01 \
	--freq counts \
	--exclude highld_set \
	--out sample_results.clean

#Create a prune.in & prune.out file to purge the SNPs
plink2 \
	--bfile sample_data.clean \
	--indep-pairwise 50 5 0.2 \
	--out sample_results.clean

#Run kings-cutoff to exclude the relatives samples
plink2 \
	--bfile sample_data.clean \
	--king-cutoff 0.0844 \
	--out sample_results.clean

#Let's keep only the good samples and SNPs and compute PCA with 10PCs
plink2 \
	--bfile sample_data.clean \
	--keep sample_results.clean.king.cutoff.in.id \
	--extract sample_results.clean.prune.in \
	--freq counts \
	--pca approx allele-wts 10 \
	--out sample_results.clean

#Create a projected matrix
plink2 \
	--bfile sample_data.clean \
	--read-freq sample_results.clean.acount \
	--score sample_results.clean.eigenvec.allele 2 5 header-read no-mean-imputation variance-standardize list-variants \
	--score-col-nums 7-16 \
	--out sample_results.clean_projected
