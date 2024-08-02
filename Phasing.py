#This Script is to Phase chr 19 with the reference map on cgenetic_map_hg18.txt.gz file, downloaded from eagle's page: https://alkesgroup.broadinstitute.org/Eagle/downloads/tables/.


#!/bin/bash

eagle \
	--bfile sample_data.clean \
	--geneticMapFile genetic_map_hg18.txt.gz \
	--chrom 19 \
	--numThreads 6 \
	--outPrefix Eagle.phased	
