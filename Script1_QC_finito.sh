#In this script I'll code the first steps for GWAS:
#I'll perform Quality Check
#The name of the Database is 1000genome
#If you want, you can run directly the script, just:
#save the script in .sh (bash)
#type 'chmod +x .../file.sh
#run it with ./file.sh



#!/bin/bash

plink1 \
	--bfile 1000genome \
	--missing \
	--freq \
	--hardy \
	--genome \
	--out plink_results

#create the F-inbreeding distribution
plink1 \
	--bfile 1000genome \
	--het \
	--out plink_results

#remove all the SNPs that are on the tails of the F-inbreeding distribution
awk 'NR>1 && ($6>0.1 || $6<-0.1) {print $1, $2}' plink_results.het > high_het.sample

#indep-pairwise provides two files: plink.results.prune.in and plink.results.prune.out
plink1 \
	--bfile 1000genome \
	--indep-pairwise 50 5 0.2 \
	--out plink_results

#now I will filter the bad SNPs
plink1 \
	--bfile 1000genome \
	--maf 0.01 \
	--geno 0.02 \
	--mind 0.02 \
	--hwe 1e-6 \
	--out plink_results

#mantain only good SNPs for LD
plink1 \
	--bfile 1000genome \
	--extract plink_results.prune.in \
	--out plink_results

#remove all the SNPs that are inbreeded
plink1 \
	--bfile 1000genome \
	--remove high_het.sample \
	--out plink_results

#crate the new dataset called 'sample_data.clean' in binary files
plink1 \
	--bfile 1000genome \
	--keep-allele-order \
	--make-bed \
	--out sample_data.clean
