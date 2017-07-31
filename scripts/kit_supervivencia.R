### Kit de supervivencia en R: Habilidades básicas

## IMPORTAR

# Directorio de trabajo
getwd()

# Objetos en wd
dir()

# Lectura de csv
dat <- read.csv("data_tetris.csv")

# Ver los datos
View(dat)

## Lectura de spss

# Librería necesaria
library(foreign)

# Leer SPSS: .sav
dat2 <- read.spss("data_tetris.sav", to.data.frame = TRUE)

# Ver los datos
View(dat2)

## EXPLORACIÓN Y MANIPULACIÓN
library(tidyverse)

# Objeto tibble
datos <- as_tibble(dat2)

# Seleccionamos variables
d1 <- datos %>% 
  select(condicion = Condition, intrusion.dia.cero = Day_Zero_Number_of_Intrusions)

# Resumir la información 
summary(d1)

# Describir
by(d1$intrusion.dia.cero, d1$condicion, mean, na.rm = TRUE)

# describeBy
library(psych)
describeBy(d1$intrusion.dia.cero, group = d1$condicion)

# Explorar por graficación
grafica <- ggplot(d1, aes(x = condicion, y = intrusion.dia.cero)) 

# Geometrías: boxplot
grafica + geom_boxplot()

# Geometría: puntos
grafica + geom_point()

# Mapear con color
grafica + geom_boxplot(aes(col = condicion))

# Mezclar y personalizar
grafica + 
  geom_boxplot(aes(col = condicion)) +
  geom_point(aes(col = condicion), position = "jitter", alpha = 0.4)

# Etiquetas
grafica + 
  geom_boxplot(aes(col = condicion)) +
  geom_point(aes(col = condicion), position = "jitter", alpha = 0.4) +
  labs(x = "Condición", 
       y = "Frecuencia de Intrusión",
       col = "") 

# ¿Estilo APA?
grafica + 
  geom_boxplot(aes(col = condicion)) +
  geom_point(aes(col = condicion), position = "jitter", alpha = 0.4) +
  labs(x = "Condición", 
       y = "Frecuencia de Intrusión",
       col = "") +
  theme_classic(base_size = 16)

## MODELOS

# Sintaxis básica: lm(y ~ x, data = df)
lm(intrusion.dia.cero ~ condicion, data = d1)

# Objetos: Modelos
modelo <- lm(intrusion.dia.cero ~ condicion, data = d1)

# Resumir
summary(modelo)

# Tabla ANOVA
anova(modelo)


