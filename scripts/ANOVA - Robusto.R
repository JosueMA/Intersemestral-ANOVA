## ANOVA 
# Cargar Paquetes ####

library(tidyverse)
library(statisticalModeling)
library(psych)
library(car)
library(ggthemes)
library(WRS2)

# Ajustar directorio de trabajo ####
# Leer datos #######

kellyz <- read_csv("Kellyetalz.csv" )
fbq <- subset(kellyz, Measure == "FBQ")

glimpse(fbq)

# Factor #####
fbq$Intervention <- as.factor(fbq$Intervention) 

## Descriptivos ####

# Datos
describe(fbq)

# Descriptivos por grupo
describeBy(fbq, group = fbq$Intervention)

## Gráficos #####

# Boxplots
ggplot(fbq, aes(x = Intervention, y = z, fill = Intervention)) +
  geom_boxplot() +
  geom_point(alpha = .3, size = 2, position = "jitter") +
  theme_bw()

# Medias
ggplot(fbq, aes(x = Intervention, y = z, col = Intervention)) +
  stat_summary(fun.y = mean,
               fun.ymin = min,
               fun.ymax = max) +
  theme_bw()

# Violín
ggplot(fbq, aes(x = Intervention, y = z, fill = Intervention)) +
  geom_violin(alpha = 0.5) +
  geom_point(alpha = .3, size = 2, position = "jitter") +
  theme_bw()

ggplot(fbq, aes(x = Intervention, y = z, fill = Intervention)) +
  geom_violin(alpha = 0.2) +
  geom_boxplot(alpha = .5) +
  geom_point(alpha = .3, size = 2, position = "jitter") +
  theme_bw()

ggplot(fbq, aes(x = z, y = ..density..)) +
  geom_histogram(aes(fill = Intervention), bins = 10) +
  geom_density(alpha = .2) +
  theme_bw()

ggplot(fbq, aes(x = z, y = ..density..)) +
  geom_histogram(aes(fill = Intervention), bins = 10) +
  geom_density(alpha = .2) +
  facet_grid(. ~ Intervention) +
  theme_bw()

## Previos ####

# Homogeneidad de varianzas
leveneTest(z ~ Intervention, data = fbq)


# Prueba de normalidad
shapiro.test(fbq$z)
mod <- lm(z ~ Intervention, data = fbq)
shapiro.test(residuals(mod))

ggplot(mod, aes(x = mod$residuals, y = ..density..)) +
  geom_histogram(data = fbq, aes(fill = Intervention), bins = 10) +
  geom_density(alpha = .2) +
  facet_grid(. ~ Intervention) +
  theme_bw()

# Código dummy
contrasts(fbq$Intervention) <- cbind(c(0, 0, 1), c(0, 1, 0))

## Modelo
mod <- lm(z ~ Intervention, data = fbq)

# Coeficientes
summary(mod)

# Intervalos de confianza del 95%
confint(mod)

# ANOVA
anova(mod)

# Supuestos
par(mfrow = c(2, 2))
plot(mod)
par(mfrow = c(1, 1))

# Predicciones del modelo
(p_mod <- evaluate_model(mod, data = fbq))

## Comparaciones planeadas ####

summary(mod)

contraste1 <- c(-2, 1, 1)
contraste2 <- c(0, -1, 1)

contrasts(fbq$Intervention) <- cbind(contraste1, contraste2)
contrasts(fbq$Intervention) <- cbind(c(-2, 1, 1), c(0, -1, 1))
fbq$Intervention

mod <- lm(z ~ Intervention, data = fbq)
contrastes_planeados <- aov(z ~ Intervention, data = fbq)
summary.lm(contrastes_planeados)

# contrasts(p_mod$dose) <- contr.poly(3)
# viagraTrend <- aov(libido ~ dose, data = p_mod)
# summary.lm(viagraTrend)
# 
# contrasts(p_mod$dose) <- contr.helmert(3)
# viagraModel2 <- aov(libido ~ dose, data = p_mod)
# summary.lm(viagraModel2)
# 
# contrasts(p_mod$dose)<-contr.treatment(3, base = 2)
# viagraModel3 <- aov(libido~dose, data = p_mod )
# summary.lm(viagraModel3)

## Comparaciones Post-Hoc ####

# Tukey
TukeyHSD(aov(mod))

# Bonferroni
pairwise.t.test(fbq$z, 
                fbq$Intervention, 
                p.adjust.method = "bonferroni")




## ¿Qué hago?

# Non-robust
summary(aov(z ~ Intervention, data = fbq))
pairwise.t.test(fbq$z, fbq$Intervention, p.adjust.method = "bonferroni")

# Robust
t1waybt(z ~ Intervention, data = fbq, tr = 0.2, nboot = 2000)
mcppb20(z ~ Intervention,  data = fbq, tr = 0.2, nboot = 2000)


# http://www.sciencedirect.com/science/article/pii/S0005796709002320?via%3Dihub
