Leaf_model_hier <-
  "model {
for (i in 1:N){
Area[i] ~ dnorm( mu.Area[i] , tau )
mu.Area[i] <- K[geno[i]]/(1+(((K[geno[i]] - No[geno[i]])/No[geno[i]]) * exp(-r[geno[i]]*(t[i]))))
}
for (g in 1:Ngeno){
No[g]~ dnorm(mu.No, tau.No)#T(-1,0)
r[g] ~ dnorm(mu.r, tau.r)#T(0,1)
K[g]~ dnorm(mu.K, tau.K)#T(0,1)
}

mu.No ~ dnorm(0.01, 1/(0.2^2))  #T(0,100)
mu.r ~ dnorm(0.0007,1/(0.0001^2))  #T(0,100) #Uninformative
mu.K ~ dnorm(10, 1/(0.2^2))   #T(0,1)
tau.No ~ dgamma(1, 1)
tau.r ~ dgamma(1,1e-8)
tau.K ~ dgamma(1, 10)
tau ~ dgamma(2,2)
}
"


