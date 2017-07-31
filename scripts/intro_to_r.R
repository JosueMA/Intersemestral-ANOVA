#### INTRODUCCIÓN A R ####

# Puede servir como una calculadora
6 + 2
7 * 3
2 ^ 3

# Realiza una suma, una resta, una multiplicación, una división y una potencia





# Las variables te permiten almacenar valores
edad <- 29 

# Imprime edad para ver su contenido
edad

# Los objetos te permiten almacenar resultados de funciones
raiz_de_edad <- sqrt(edad) 

# Puedes crear variables con otras variables
manzanas <- 45
peras <- 25
naranjas <- 12
frutas <- manzanas + peras + naranjas

# Pueden ser variables con caracteres o strings
nombre <- "Juanita"

# Valores lógicos
mi_logico <- TRUE

# Tipos de datos básicos
class(manzanas)
class(nombre)
class(4L)
class(4.5)
class(mi_logico)
class("Said")

# Declara una variable numérica, otra lógica y otra de caracteres



# Utiliza la función class() para saber que tipo de dato son



# No puedes mezclar operaciones entre tipos distintos de datos
manzanas + nombre
nombre + mi_logico

# Este es un caso especial
mi_logico + manzanas

# Los valores logicos: TRUE = 1, FALSE = 0
mi_logico + mi_logico
mi_logico + FALSE

####ARREGLOS DE DATOS#######

# Vectores: son arreglos de una dimension que pueden contener datos
# Numéricos, caracteres o logicos(booleanos)
vector_num <- c(1, 2, 3)
vector_caracter <- c("a", "b", "c") 
vector_logico <- c(TRUE, FALSE, TRUE)

# Declara 3 vectores: numérico, caracter y lógico




# Ejemplos de vectores: peso de cinco personas en Kg
peso_vector <- c(100, 70, 56, 91, 83)

# Estatura en cm de cinco personas
estatura_vector <-  c(180, 168, 150, 190, 170)


# Tu primer gráfico:
# plot(estatura_vector, _____)


# Asigna los nombres de las personas
names(peso_vector) <- c("Hugo", "Paco", "Luis", "Juan", "Pedro")

# Asigna los nombres al vector de estatura
names(estatura_vector) 
  
# Arreglalos en una misma estructura de datos: data.frame 
data.frame(peso_vector, estatura_vector)

# Operaciones con vectores: calcula el peso total de las personas
peso_total <- 100 + 70 + 56 + 91 + 83
sum(peso_vector)

# Obten la suma total de las estaturas


# Peso más de lo que mido
peso_vector > estatura_vector

# Seleccionar elementos
peso_vector["Hugo"]

# Selecciona a Pedro


# Seleccionar varios elementos
peso_vector[3:5]
peso_vector[c(1,3,5)]
peso_vector[c("Paco", "Luis")]

# Selecciona los cuatro primeros de estatura


# Calcula los descriptivos del peso
mean(peso_vector)
median(peso_vector)
sd(peso_vector)
var(peso_vector)
summary(peso_vector)

# Ahora tu en estatura




#### COMPARATIVOS ####
# utiliza los <, >, <=, >=, ==, != para seleccionar elementos
peso_vector > 0
peso_vector < 0 
peso_vector == 100
peso_vector != 100


# Selecciona los que miden más de 150 cm con >



# Para saber los valores exactos de los dias de perdida
peso_vector[peso_vector >= 70 & peso_vector <= 80]

# Obten los casos con estaturas entre 160 y 170


##### MATRICES #####

# Es un arreglo cuadrado(de dos dimensiones) de elementos de la misma clase.
matrix(1:9, byrow = TRUE, nrow = 3)

# Disena una matriz de 3x3 con valores del 11 al 19


# Una matriz con valores de la estatura de tres hombres y tres mujeres
hombres <- c(1.72, 1.68, 1.77)
mujeres <- c(1.50, 1.62, 1.70)

matriz_estatura <- matrix(c(hombres, mujeres), nrow = 3)
rownames(matriz_estatura) <- c("Gringos", "Mexicanos", "Europeos")
colnames(matriz_estatura) <- c("hombres", "mujeres")

# si no estas seguro de que se trata de una matriz
# usa la funcion class()
class(matriz_estatura)

# Seleccionar casos de una matriz: [row, col]
matriz_estatura[ 2, 1]
matriz_estatura[ ,2]
matriz_estatura[2, ]
matriz_estatura["Gringos", ]

# Selecciona solo a los europeos


# Selecciona a la mexicana de 1.62


# Selecciona a la columna de hombres


# Media de los hombres
mean(matriz_estatura[,"hombres"])

# Obten la media de las mujeres


# Aritmética con matrices
# Estatura en pulgadas
matriz_estatura * 39.3701

# Obten la estatura en cm


#### FACTORES ####

# Los factores son para variables categoricas: nominales
genero_vector <- c("Masculino", "Femenino", "Femenino", "Masculino", "Masculino")
genero_factor <- factor(genero_vector)

# Checa con class() de que tipo de variables se trata



# Los factores tambien pueden ser ordinales
temperatura_vector <- c("Alta", "Baja", "Alta","Baja", "Media")
factor_temperatura_vector <- factor(temperatura_vector, order = TRUE, levels = c("Baja", "Media", "Alta"))

# Imprimelos y checa su clase




# Summary sobre factores
summary(genero_vector)
summary(genero_factor)

# Aplica summary sobre vector de temperatura y sobre factor de temperatura



# Comparacion de un vector versus un factor
genero_vector < genero_factor

# Pero que tal un factor con niveles 
alto <- factor_temperatura_vector[1] 
bajo <- factor_temperatura_vector[2]
alto > bajo

# Realiza la comparacion (x == y), de media y baja


###### DATA.FRAME #####
# Arreglo cuadrado de datos, admiten diferentes tipos de datos

# Carga el paquete MASS
library(MASS)

# R tiene datos cargados por default, por ejemplo "anorexia"
# Explora el dataset "anorexia"
class(anorexia)
head(anorexia)
tail(anorexia)
summary(anorexia)

#El data.frame puede contener factores
class(anorexia[,"Treat"])

#Asi como variables numericas
class(anorexia[, "Prewt"])

#Obten el tipo de la columna "Postwt"


# Mas sencillo, utiliza la funcion str()
str(anorexia)

# Podemos crear un data.frame
name <- c("Mercurio", "Venus", "Tierra", "Marte", "Jupiter", "Saturno", "Urano", "Neptuno")
type <- c("Planeta Terrestre", "Planeta Terrestre", "Planeta Terrestre", 
          "Planeta Terrestre", "Gigante de gas", "Gigante de gas", "Gigante de gas", "Gigante de gas")
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# La funcion data.frame une los diferentes tipos de datos
planetas <- data.frame(name, type, diameter, rotation, rings)

# Explora planetas y obten la clase o el tipo de datos que lo conforman





# Obtener valores del data.frame: [row , col]
planetas[ , "name"]
planetas[6 , ]

# Obten el diametro, la rotacion y los anillos de los planetas de Gas
planetas[5:8, c(1, 3:5)]

# Obten las mismas variables pero solo para marte


# El operador $ te permite seleccionar elementos de un objeto
planetas$name
planetas$rotation

# Selecciona toda la variable diameter y la variable type



# Muestra los planetas sin anillos
planetas[planetas$rings == FALSE, ]

# Muestra solo los planetas gaseosos y guardalos: gas


#### LISTAS ####
# Permite almacenar diferentes objetos de forma ordenada, sin importar
# si son vectores, matrices, data.frames, funciones, analisis...

my_vector <- 1:10 
my_matrix <- matrix(1:9, ncol = 3)
my_df <- mtcars[1:10,]

# Almacena lo anterior de forma ordenada
my_list <- list(my_vector, my_matrix, my_df)

# Para acceder a sus elementos, necesitas [[]]
my_list[[3]]
class(my_list)



