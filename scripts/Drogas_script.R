# Directorio
setwd("~/Desktop/Intersemestral")

dir()
a<-read.csv("Drogas.csv")

#Revisar variables.####
dim(a)
head(a)
tail(a)
str(a)

#Cambiar variables####
a$GROUP=factor(a$GROUP,
             levels=c(1,2),
             labels=c("Control", "Adicto"))

a$Impulsividad=as.numeric(a$Impulsividad)
a$AGE=as.numeric(a$AGE)
a$YEARSCON=as.numeric(a$YEARSCON)

# Estadistica descriptiva

# Medidas de tendencial central
# Media 
mean(a$AGE)


# Moda 

mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

mode(a$AGE)

# Mediana 
median(a$Impulsividad)


# Medidas de dispersion 

# Rango 
min(a$Impulsividad, na.rm = TRUE)
max(a$Impulsividad, na.rm = TRUE)
range(a$AGE)
quantile(a$AGE)
IQR(a$AGE)
#Desviacion estandar 

sd(a$AGE)


#varianza

var(a$AGE)

###LIBRERIAS PSych
summary(a)







































































