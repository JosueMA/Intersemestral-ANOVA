## Modelos y Análisis de Datos

# Librerías útiles
library(statisticalModeling)
library(psych)
library(tidyverse)
library(mosaic)

# Datos
data("Birth_weight")

# Explorar datos
head(Birth_weight, n = 10)
View(Birth_weight)

# Objeto tibble
Birth_weight <- as.tbl(Birth_weight)

# En kilos
datos_kg <- Birth_weight %>% 
  mutate(baby_wt_kg = round(baby_wt * 28.3495 / 1000, 3),
         mother_wt_kg = round(mother_wt * 453.592 / 1000, 3))

## Modelar el peso del bebé: 3 kg para todos
pred_0 <- datos_kg$baby_wt_kg - 3.00
pred_0_2 <- pred_0 ^ 2 

# Checa las distribuciones
hist(pred_0)
hist(pred_0_2)

# Cantidad de error en el modelo: 3 kg
(error_0 <- sum(pred_0_2))

## Modelo basado en los datos: media como modelo
pred_1 <- datos_kg$baby_wt_kg - mean(datos_kg$baby_wt_kg)
pred_1_2 <- pred_1 ^ 2

# Representación rápida 
par(mfrow = c(2, 2)) # panel en cuatro
hist(pred_0, main = "Modelo: 3 kg")
hist(pred_0_2, main = "Modelo: 3 kg")
hist(pred_1, main = "Modelo: Basado en la media")
hist(pred_1_2, main = "Modelo: Basado en la media")
par(mfrow = c(1, 1)) # panel normal

# Error del modelo con la media:
(error_1 <- sum(pred_1_2))

# Cuanto error reduce la media del que deja el modelo simple
error_0 - error_1

# Porcentaje de reducción de error: PRE
1 - error_1 / error_0

## Condicionando el Peso a variabilidad en Otros Predictores

# Modelo compacto: solo la media
mod_com <- lm(baby_wt_kg ~ 1, data = datos_kg) 

# Resumimos
summary(mod_com)

# ¿Qué es el intercepto?
mean(datos_kg$baby_wt_kg)

# Tabla ANOVA
anova(mod_com)

# Predicciones del modelo compacto
p_sim <- evaluate_model(mod_com, data = datos_kg)
head(p_sim, n = 10)

## Modelo aumentado: ¿reduce error incluir predictores?
mod_aum <- lm(baby_wt_kg ~ smoke, data = datos_kg)

# Resumen
summary(mod_aum)

# Los coeficientes de donde salen
mean(baby_wt_kg ~ smoke, data = datos_kg, na.rm = T)

# Tabla ANOVA
anova(mod_aum)

# Predicciones del modelo
p_aum <- evaluate_model(mod_aum, data = datos_kg)
head(p_aum, n = 10)

# Comparación de modelos
anova(mod_com, mod_aum)

# Porcentaje de reducción de error
1 - 217.62 / 231.22

## Comparación de modelos: errores de predicción

# Comparación del MSE con validación cruzada k-fold  
(ensayos <- cv_pred_error(mod_com, 
                         mod_aum,
                         k = 10, 
                         ntrials = 10))

# Errores de predicción de cada modelo
boxplot(mse ~ model, data = ensayos)

# Si necesitan un valor p:
t.test(mse ~ model, data = ensayos)


