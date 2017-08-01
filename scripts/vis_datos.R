## Visualización de datos
library(tidyverse)
library(psych)
library(MASS)

## Importancia de visualizar los datos

# Datos
datos <- read_csv("Datasaurus_data.csv")

# Obtén los descriptivos:
describe(datos)

# Gráfica: 
plot(datos)

## Gráficos 

# Datos
anorexia <- as_tibble(anorexia)

# Estructura básica: ggplot(datos, aes(x, y)) + geom_function()
ggplot(anorexia, aes(x = Prewt, y = Postwt)) +
  geom_point()

# Mapear el Tratamiento con color
ggplot(anorexia, aes(x = Prewt, y = Postwt, col = Treat)) +
  geom_point()

# Tratamiento con size
ggplot(anorexia, aes(x = Prewt, y = Postwt, size = Treat)) +
  geom_point()

# Con ambos: size y color
ggplot(anorexia, aes(x = Prewt, y = Postwt, col = Treat, size = Treat)) +
  geom_point()

# Otras opciones son shape
ggplot(anorexia, aes(x = Prewt, y = Postwt, shape = Treat, col = Treat)) +
  geom_point()

# Quizás alpha:
ggplot(anorexia, aes(x = Prewt, y = Postwt, alpha = Treat)) +
  geom_point()

# Se puede manipular los aesthethics manualmente
ggplot(anorexia, aes(x = Prewt, y = Postwt)) +
  geom_point(col = "blue")

# ¿Cuál es el problema con el siguiente gráfico?
ggplot(anorexia, aes(x = Prewt, y = Postwt, col = "blue")) +
  geom_point()

## Facets: útiles para agrupar observaciones

# Panel por tratamiento
ggplot(anorexia, aes(x = Prewt, y = Postwt)) +
  geom_point() +
  facet_grid(. ~ Treat)

# Ajustar manualmente los facets  
ggplot(anorexia, aes(x = Prewt, y = Postwt)) +
  geom_point() +
  facet_wrap(~ Treat, nrow = 3)

## Objetos Geométricos

# Lineas
ggplot(anorexia, aes(x = Prewt, y = Postwt)) +
  geom_smooth() 

# Agrupadas y con diferente linetype
ggplot(anorexia, aes(x = Prewt, y = Postwt, group = Treat, lty = Treat)) +
  geom_smooth() 

# Además color
ggplot(anorexia, aes(
  x = Prewt, 
  y = Postwt, 
  group = Treat, 
  lty = Treat, 
  col = Treat)) +
  geom_smooth(show.legend = FALSE) 

# Mostrar múltiples geometrías con "+"
ggplot(anorexia, aes(x = Prewt, y = Postwt)) +
  geom_smooth() +
  geom_point()

# Mostrar sólo los puntos de CBT
ggplot(anorexia, aes(x = Prewt, y = Postwt)) +
  geom_point(data = filter(anorexia, Treat == "CBT")) +
  geom_smooth() 

# Mostrar a las de menor peso
ggplot(anorexia, aes(x = Prewt, y = Postwt)) +
  geom_point(data = filter(anorexia, Prewt < 80), col = "red") +
  geom_smooth(se = FALSE) 

## Resumen estadístico 

# Frecuencias
ggplot(anorexia, aes(x = Treat)) +
  geom_bar()

# Porcentajes
ggplot(anorexia, aes(x = Treat, y = ..prop.., group = 1)) +
  geom_bar()

# Medias 
ggplot(anorexia, aes(x = Treat, y = Postwt)) +
  stat_summary(
    fun.ymin = min,
    fun.ymax = max,
    fun.y = mean
  )

# Tendencias
ggplot(anorexia, aes(x = Treat, y = Postwt)) +
  stat_summary(
    fun.ymin = min,
    fun.ymax = max,
    fun.y = mean
  ) +
  stat_summary(
    aes(group = 1),
    fun.y = mean,
    geom = "line",
    lty = 2
  ) +
  theme_minimal()

## Sistemas de coordenadas

# Horizontales
ggplot(anorexia, aes(x = Treat, y = Postwt)) +
  geom_boxplot() +
  coord_flip()

# Barras horizontales
ggplot(anorexia, aes(x = Treat, fill = Treat)) +
  geom_bar() +
  coord_flip()

# Polares
ggplot(anorexia, aes(x = Treat, fill = Treat)) +
  geom_bar() +
  coord_polar()

## Legendas

# Ejes y título
ggplot(anorexia, aes(x = Treat, y = Postwt, fill = Treat)) +
  geom_boxplot() + 
  labs(
    x = "Tratamiento",
    y = "Peso (kg)",
    fill = "",
    title = "Efecto de Tratamientos",
    subtitle = "Terapia familiar es la mejor"
  ) +
  theme_classic() +
  theme(legend.position = 'none')
  

