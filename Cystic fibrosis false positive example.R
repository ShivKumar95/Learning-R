# monte carlo simulation on Cystic fibrosis

prev <- 0.00025 # disase prevalence
N <- 100000 # no. of test
outcome <- sample(c("Disease","Healthy"),N, replace = TRUE, prob = c(prev,1-prev))

N_D <- sum(outcome =="Disease")
N_H <- sum(outcome =="Healthy")

# for each person, randlomly determine if the test is + or -
accuracy <- 0.99
test <- vector("character",N)
test[outcome == "Disease"] <- sample(c("+","-"),N_D, replace = TRUE, prob = c(accuracy,1-accuracy))
test[outcome == "Healthy"] <- sample(c("-","+"),N_H, replace = TRUE, prob = c(accuracy,1-accuracy))

table(outcome,test)