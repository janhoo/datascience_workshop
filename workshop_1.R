

foo <- 12
bar <- "I am string"

class(foo)
class(bar)

foo2 <- c(3,3,5,5,7,8)


foo2[6]
foo2[c(1,4)]

i<-3
foo2[i]
foo2[c(i,6)]

foo2+1
## loops
for (a in foo2){
  cat(a+1)
}

for (a in foo2){
  cat(a+1,"       ")
}

length(foo2)
foo2 <- c(3,3,5,5,7,8)
for (i in 1:length(foo2)){
  foo2[i]<-foo2[i]+1
}
foo2

## vectorization
foo2 + c(1,10000)

## if 
foo2 <- c(3,3,5,5,7,8)
for (i in 1:length(foo2)){
  if (foo2[i] >= 5){
    foo2[i] <- foo2[i] - 1000
  } else {
    foo2[i] <- foo2[i] + 1
  }
}
foo2






## dataframes
mtcars
?mtcars

class(mtcars)
str(mtcars)
?str
str(object=mtcars)
head(mtcars,n=13)
tail(mtcars)
summary(mtcars)


##subsetting data frames
mtcars[3,4]
mtcars[3:5,"disp"]
mtcars[c(5,2,2:3,8),c("gear","cyl","gear")]
foo<-"gear"
i<-2
bar<-mtcars[c(5,i,2:3,8),c(foo,"cyl","gear")]
names(bar)
names(bar)<-c("gear","cyl","gear2")
row.names(mtcars)

mtcars$mpg




## plotting
plot(mtcars$wt,mtcars$mpg)
plot(x=mtcars$wt,y=mtcars$mpg, 
     xlab="weight",
     main="milage per gallon",
     pch=0,
     col="red",
     cex=2,
     type="p",
     ylab="miles per gallon")

?plot


## saving and loading
# working directory

getwd()
setwd("/Users/holstein/Dropbox/rwd/workshops/datascience_workshop")

write.csv(mtcars,file="mtcars.csv")
a<-readxl::read_xlsx("mtcars.xlsx")

(mt<-read.csv("mtcars.csv",row.names = 1))
?read.csv


# 0) cars
# 1) make new folder
# 2) use getwd() to find out your current working dir
# 3) setwd("new folder") to new folder
# 4) save cars to new folder: use write.csv()
# 5) load cars from new directory: use read.csv()
# 6) plot the cars dataset with plot()

getwd()
list.dirs()
dir.create("/Users/holstein/Dropbox/rwd/workshops/datascience_workshop/cars")  
setwd("/Users/holstein/Dropbox/rwd/workshops/datascience_workshop/cars")
list.files()
write.csv(cars,file="cars.csv")
list.files()
mycars<-read.csv("cars.csv",row.names=1)
str(mycars)
plot(mycars$speed,mycars$dist)





## day2 stat. modelling
mtcars
model<-lm(mpg~hp,data=mtcars)

model
plot(mtcars$hp,mtcars$mpg,xlim=c(0,350),ylim=c(0,35))
abline(30.09886,-0.06823)
# same as 
abline(model)

## example 2
plot(cars$speed,cars$dist,
     xlim=c(0,max(cars$speed)),
     ylim=c(0,max(cars$dist))
     )
model2 <- lm(dist~speed,data = cars)
abline(model2)
model2
summary(model2)


model3 <- lm(dist~speed-1,data = cars)
abline(model3,col="red")
summary(model3)

df<-data.frame(speed=c(0,2,40,100))
predict(model2,df)

plot(model3)

predicted_dist <- predict(model3,newdata = cars)
observed_dist <- cars$dist
prediction_error <- observed_dist - predicted_dist
RootMeanSquaredError <- sqrt(mean(prediction_error^2))
# or
rmse <- sqrt(mean((cars$dist-predict(model3,newdata = cars))^2))


