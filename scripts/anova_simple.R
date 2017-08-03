## ANOVA
library(statisticalModeling)
library(psych)
library(car)

# Leer datos
dat <- read.delim("Viagra.dat")

# Factor
dat$dose <- factor(dat$dose, 
                   levels = c(1, 2, 3),
                   labels = c("Placebo", "Dosis Baja", "Dosis Alta"))

## Descriptivos

# Datos
describe(dat)

# Descriptivos por grupo
describeBy(dat$libido, group = dat$dose, mat = TRUE)

## Gráficos

# Boxplots
ggplot(dat, aes(x = dose, y = libido, fill = dose)) +
  geom_boxplot() 

# Medias
ggplot(dat, aes(x = dose, y = libido, col = dose)) +
  stat_summary(fun.y = mean,
               fun.ymin = min,
               fun.ymax = max)

# Violín
ggplot(dat, aes(x = dose, y = libido, fill = dose)) +
  geom_violin(alpha = 0.2)


## Previos

# Homogeneidad de varianzas
leveneTest(libido ~ dose, data = dat)

# Código dummy
contrasts(dat$dose) <- cbind(c(0, 0, 1), c(0, 1, 0))

## Modelo

mod <- lm(libido ~ dose, data = dat)

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
p_mod <- evaluate_model(mod, data = dat)

## Comparaciones Post-Hoc

# Tukey
TukeyHSD(mod)

# Bonferroni
pairwise.t.test(dat$libido, 
                dat$dose, 
                p.adjust.method = "bonferroni")

