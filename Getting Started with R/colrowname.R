#Named Vectors

Charlie <- 1:5
Charlie

#give names
names(Charlie) <- c("a","b","c","d","e")


Charlie
Charlie['d']
names(Charlie)

#clear names
names(Charlie) <- NULL
Charlie

#----------------------------
#Naming Matrix Dimensions 1

#times and each are different

temp.vec <- rep(c("a","B","zZ"),each = 3)

Bravo <- matrix(temp.vec,3,3)
Bravo


rownames(Bravo) <- c("How","are","you")
Bravo
colnames(Bravo) <- c("X","y","z")
Bravo


Bravo["are","y"] <- 0
Bravo

rownames(Bravo)
