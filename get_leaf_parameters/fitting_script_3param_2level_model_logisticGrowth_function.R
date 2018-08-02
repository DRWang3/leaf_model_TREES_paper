## Bayesian Estimation of leaf growth parameters ###
# 3-param, 2-level

library("rjags")
setwd("~/Dropbox/Research/BRASSICA/ms/Lf_model/Leaf_model_TREES_paper")

Dat = read.csv("data/Nonlimit_LeafArea_data_longVertical_form.csv")
Dat$therm_time_leaf = Dat$therm_time_adj - Dat$emerge_therm_time_adj

## remove any first or second leaves 
idx.rm= c(which(Dat$leaf==1), which(Dat$leaf==2) )
Dat = Dat[-idx.rm,]

Dat$lineFactor= rep(NA, dim(Dat)[1])

## turn geno into line factors
for(i in 1:length(unique(Dat$line))){
  Dat$lineFactor[which(Dat$line== unique(Dat$line)[i])] = i
}

#### 3 parameter fuction for estimating leaf growth against thermal time
# Parameters
# K = maximum leaf area
#No= initiation value
# r = growth rate

Lgrow_Fun<-function(P, Dat){
  K<-P[1]
  No<-P[2]
  r<-P[3]
  t<-Dat
  Area<-K/(1+(((K - No)/No) * 2.71828^ (-r*(t))))
  return(Area)
}


### chains and burnin 
adaptSteps = 7500             # Number of steps to "tune" the samplers.
burnInSteps = 7500            # Number of steps to "burn-in" the samplers. original: 5000
nChains = 4                   # Number of chains to run.
DICsteps= 20000                # Number of steps of sample DIC
numSavedSteps= 1000        # Total number of steps in chains to save.
thinSteps= 50                   # Number of steps to "thin" (1=keep every step).
nPerChain = ceiling( ( numSavedSteps * thinSteps ) / nChains ) # Steps per chain.

parameters<-c("No","K","r","mu.No","mu.K","mu.r",
              "tau.No","tau.K","tau.r","tau")
datalist1<-list(N=length(Dat$area_cm2),Ngeno=length(unique(Dat$lineFactor)),
                geno=Dat$lineFactor,
                Area=Dat$area_cm2,
                t=Dat$therm_time_leaf)
##################################
##### Impliment model in JAGS ####
source("scripts/Leaf_model_3param_2level.R")
#################################
### running each curve
print("initialize models")
model1 <- jags.model(textConnection(Leaf_model_hier), 
                     data = datalist1, n.chains=nChains , n.adapt=adaptSteps)

#################################
print("updating")
update(model1, burnInSteps) # Burnin for burnInSteps samples

##########################################

print("sampling chains")
##### mcmc_samples  #####
mcmc_samples1<- coda.samples(model1,
                             variable.names=parameters,
                             n.iter=nPerChain , thin=thinSteps )

### convert rjags mcmc object to matrix
mcmcChain = as.matrix( mcmc_samples1)
sigma =1  / sqrt(mcmcChain[, "tau" ] )
mcmcChain = as.data.frame(cbind( mcmcChain, sigma ))

## gelmen and rubin convergence diagnostics (should be very close to 1 for all paramters (1.1 max)
## if too high look at trace plots below consider running longer update/burning and/or chains or changing priors
g1<-gelman.diag(mcmc_samples1)
g1
### look at median estimates and write table
meds<-apply(mcmcChain,2,median)
meds

meds.summary=data.frame(line= unique(Dat$line), K= meds[1:3], N= meds[4:6], r= meds[10:12])

save(list=c("Dat", "meds", "mcmcChain", "meds.summary"), file= "output/Nonlimit_3param_2level_results.Rbin")


################ plot 

pdf("output/median_prediction_plot_Diversity_nonLimiting_3param_2level_leaf_growth_model_final.pdf", width=8, height=7)
layout(matrix(c(1:4), 2, 2, byrow = TRUE))
for(i in 1:length(unique(Dat$line))){
  par(mar = c(4,5,4,4))
  l= unique(Dat$line)[i]
  
  y.limits= c(0, max(Dat[Dat$line == l,]$area_cm2, na.rm=T)*1.5)
  plot(Dat[Dat$line == l,]$therm_time_leaf, Dat[Dat$line == l,]$area_cm2, 
       col= "darkgray", cex = 0.5, xlim= c(0, 20000),
       xlab=expression(paste('thermal time (', degree~C, ' hr)'))  , ylab= expression(paste('area (', 'cm'^'2', ')')) )
  
  k= which(meds.summary$line == l)
  params= as.numeric(meds.summary[k, 2:4])
  lines(seq(1,20000,10), Lgrow_Fun(params, seq(1,20000,10)), col= "red")
  
  text(15000, y.limits[2]*0.6, c(paste("line =",Dat[Dat$line == l,]$line,sep=" ")),pos=4, cex=0.75)
  text(15000, y.limits[2]*0.56, c(paste("K =",round(params[1],2),sep=" ")),pos=4, cex=0.75)
  text(15000, y.limits[2]*0.53, c(paste("No =",round(params[2],2),sep=" ")),pos=4, cex=0.75)
  text(15000, y.limits[2]*0.50, c(paste("r =",round(params[3],6),sep=" ")),pos=4, cex=0.75)
}
dev.off()

