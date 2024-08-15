# In this script I will run the code to show the manhattan plot
# The data is in GWAS_regression_binary.B1.glm.firth file
import gwaslab as gw
import matplotlib.pyplot as plt  

sumstats = gw.Sumstats("GWAS_regression_binary.B1.glm.firth", fmt ="plink2")

sumstats.plot_mqq(
	skip=2,
	cut=20,
	mode = "m",
	anno = True,
	sig_level = 5e-08,
	sig_level_lead = 5e-08,
	sig_line = True,
	arm_scale_d={1:1,2:0.8},
	title = "First try GWAS",
	# save = "Manhattan_plot2"
	)
plt.show()
