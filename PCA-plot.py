#In this script I'll plot PCA results

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

pca = pd.read_table("~/1000genome/sample_results.clean_projected.sscore", sep="\t")
pca

ped = pd.read_table("~/1000genome/population_info.txt", sep="\t")
ped

pcaped = pd.merge(pca,ped,right_on="sample",left_on="IID",how="inner")
pcaped

plt.figure(figsize=(10,10))
sns.scatterplot(data=pcaped, x="PC1_AVG",y="PC2_AVG",hue="pop",s=50)
plt.show()
