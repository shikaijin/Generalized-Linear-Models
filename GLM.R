dat<-read.table("heartdisease.txt",header = T)
dat$heartdiseasef<-factor(dat$heartdisease)
dat$cholesterolf<-factor(dat$cholesterol)
dat$pressuref<-factor(dat$pressure)

# Fit the saturated model
model0<-glm(y~cholesterolf*pressuref*heartdiseasef,family = poisson,data = dat)
summary(model0)
  

# Extreact deviance and its degrees of freedom
model0$df.residual

# Drop the 3rd-level interaction
# The model describes "all pairs conditionally independent" situation
model1<-glm(y~cholesterolf*pressuref+cholesterolf*heartdiseasef+pressuref*heartdiseasef,family = poisson, data = dat)
summary(model1)
model1$deviance

model1$df.residual

# Test if Model 1 is as good as Model 0
# Calculate the p-value
df<-model1$df.residual-model0$df.residual
1-pchisq(model1$deviance-model0$deviance,df)


model2<-glm(y~cholesterolf+pressuref+heartdiseasef+cholesterolf*pressuref+cholesterolf*heartdiseasef,family = poisson, data = dat)
summary(model2)


model3<-glm(y~cholesterolf+pressuref+heartdiseasef+cholesterolf*pressuref+pressuref*heartdiseasef,family = poisson, data = dat)
summary(model3)


model4<-glm(y~cholesterolf+pressuref+heartdiseasef+cholesterolf*heartdiseasef+pressuref*heartdiseasef,family = poisson, data = dat)
summary(model4)


# The expected frequencies "fv" (Model 1) are fairly close to the observed frequencies "y"
fv1<-model1$fitted.values
rd1<-residuals.glm(model1,type = "deviance")
cbind(cholesterol, pressure,heartdisease,y,fv1,rd1)


plot(fv1,rd1,xlab = "Fitted values", ylab = "Deviance",xlim = c(0,250),ylim = c(-2,2))
plot(log(fv1),rd1,xlab = "Log fitted values", ylab = "Deviance",xlim = c(0,6),ylim = c(-2,2))
df1<-model2$df.residual-model1$df.residual
1-pchisq(model2$deviance-model1$deviance,df1)


df2<-model3$df.residual-model1$df.residual
1-pchisq(model3$deviance-model1$deviance,df2)

df3<-model4$df.residual-model1$df.residual
1-pchisq(model4$deviance-model1$deviance,df3)


dat$resp<-cbind(dat$y, dat$m-dat$y)
dat

model5<-glm(resp~cholesterolf+pressuref,family = binomial(link = logit),data = dat)
summary(model5)


rdev<-residuals.glm(model5,"deviance")
linpred<-model5$linear.predictors
linpred


fitval<-model5$fitted.values
cbind(fitval, exp(linpred)/(1+exp(linpred)))


rp<-residuals.glm(model5, "pearson")
rp

plot(fitval,rdev,xlab="Fitted Values",ylab="Residuals", pch=1)
plot(fitval,rdev, ylim=c(-3,3),xlab="Fitted Values",ylab="Residuals", pch=1)
points(fitval,rp,pch=4)
abline(h=2,lty=2)
abline(h=-2,lty=2)
legend(x=0.1,y=3,legend=c("Deviance Residual","Pearson Residual"),pch=c(1,4))


model6<-glm(resp~cholesterolf,family = binomial(link = logit),data = dat)
summary(model6)


model7<-glm(resp~pressuref,family = binomial(link = logit),data = dat)
summary(model7)


b<-coef(model5)
varb<-diag(vcov(model5))
OR<-exp(b)
ORCI1<-exp(b-qnorm(0.975)*sqrt(varb))
ORCI2<-exp(b+qnorm(0.975)*sqrt(varb))
cbind(OR,ORCI1,ORCI2)



