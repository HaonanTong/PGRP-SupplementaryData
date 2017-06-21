# PGRP-SupplementaryData
Here are the files and scripts for the differential expression analysis in Chang et al. (author of thse scripts is Gary Hon UT Southwest, Dallas)
 Below is a brief description:
1. The “log” file contains the list of commands used to generate the files. The starting file is “kat.all.rpkm”, which contains the RPKM of all genes in a matrix format. The triplicate experiments are all grouped together. Time increases from left to right.
2. To answer Nan’s question, we do not transform the RPKM data. Please note that we only use reads mapping to exons to define RPKM.
3. One output is a set of differentially expressed genes for each timepoint, as compared to t=0.
4. To answer Nan’s question, the 50% difference is defined as abs(log2( E_{i} / E_0 )) >= log2(1.5) ~ 0.58 . 
In the end, we merge all of these individual timepoints together to generate one up-regulated file and one down-regulated file. There are 1235 up-regulated genes and 1147 down-regulated genes. This sums to 2382 genes in 2382 genes in Figure 1D’s red circle.
Chang, Katherine Noelani, et al. "Temporal transcriptional response to ethylene gas drives growth hormone cross-regulation in Arabidopsis." Elife 2 (2013): e00675.
