## fit gamma distributions for parameter posteriors

setwd("~/Dropbox/Research/BRASSICA/ms/Lf_model/Leaf_model_TREES_paper")
load(file= "output/Nonlimit_3param_2level_results.Rbin")

## describe distributions of posteriors
dist.df= as.data.frame(matrix(ncol = 7, nrow= 3))
names(dist.df) = c("line", "K_shape", "K_rate", "N0_shape", "N0_rate", "r_shape", "r_rate")
dist.df$line = unique(Dat$line)

### fit K parameter to gamma distributions. idx 1-3
library(fitdistrplus)
k=1
for(i in 1:3){
  idx.nonzero = which(mcmcChain[i]> 0)
  vec = mcmcChain[idx.nonzero,i]
  fit.gamma = fitdist(vec, distr= "gamma", method="mle")
  summary(fit.gamma)
  dist.df[k,2:3] = fit.gamma$estimate
  setEPS()
  postscript(paste("output/NonLimit_K_gamma_distribution_3param_2level_estimation", unique(Dat$line)[k], ".eps", sep="" ))
  plot(fit.gamma)
  dev.off()
  k=k+1
}

### fit N0 parameter to gamma distributions. 4-6
k=1
for(i in 4:6){
  idx.nonzero = which(mcmcChain[i]> 0)
  vec = mcmcChain[idx.nonzero,i]
  fit.gamma = fitdist(vec, distr= "gamma", method="mle")
  summary(fit.gamma)
  dist.df[k,4:5] = fit.gamma$estimate
  setEPS()
  postscript(paste("output/NonLimit_N0_gamma_distribution_", unique(Dat$line)[k], ".eps",sep="" ))
  plot(fit.gamma)
  dev.off()
  k=k+1
}

### fit r parameter to gamma distributions. idx 10-12
## note that in these plots, values of r are scaled 100x to avoid numerical problems
k=1
for(i in 10:12){
  idx.nonzero = which(mcmcChain[i]> 0)
  vec = mcmcChain[idx.nonzero,i]
  fit.gamma = fitdist(vec*100, distr= "gamma", method="mle") # scale
  summary(fit.gamma)
  dist.df[k,6:7] = c(fit.gamma$estimate[1], fit.gamma$estimate[2]*100) #scale rate back
  setEPS()
  postscript(paste("output/NonLimit_r_gamma_distribution_", unique(Dat$line)[k], ".eps",sep="" ))
  plot(fit.gamma)
  dev.off()
  k=k+1
}

write.table(dist.df, "output/NonLimit_posteriorParam_3param_2level_distribution_gammaDist.csv", sep=",", row.names=F, quote=F)
