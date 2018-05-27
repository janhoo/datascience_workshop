

foo<-function(data){
  summary(data)
}



data(cars)
cars
head(cars,n=10)
tail(cars)


summary(cars)
str(cars)

plot(cars$speed,cars$dist)

write.csv(cars,file="cars.csv")


reg<-lm(dist~speed,data=cars)
abline(reg)

hist(cars$speed)








# multivariate models
data(mtcars)
mtcars


fit_glm<-glm(mpg~hp+wt,data=mtcars)
summary(fit_glm)

plot(mtcars$mpg,mtcars$wt)
plot(mtcars$mpg,mtcars$hp)


predict(fit_glm,newdata = mtcars )
dat<-mtcars
dat$prediction<-predict(reg,newdata = mtcars )
plot(dat$mpg,dat$prediction)
# RMSE
rmse<- sqrt(  mean( (dat$mpg-dat$prediction)^2        )           )


# randomforest
fit_rf <- randomForest::randomForest(mpg~hp+wt,data=mtcars)
summary(fit_rf)


pred<-predict(fit_rf,mtcars)
dat$rf_prediction<-pred
plot(pred,mtcars$qsec)

# RMSE
rmse<- sqrt(  mean( (dat$mpg-dat$rf_prediction)^2        )           )








