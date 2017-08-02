# generate pairs of x-y values
x1 = c(seq(0, pi, length = 50), seq(pi, 2*pi, length = 50))
y1 = cos(x1) / sin(x1)
x2 = seq(1.02 * 2 * pi + pi/2, 4*pi + pi/2, length = 50)
y2 = tan(x2)

# set graphical parameters
op = par(bg="black", mar=rep(.5,4))

# plot
plot(c(x1, x2), c(y1, y2), type = "n", ylim = c(-11, 11))
for (i in seq(-10, 10, length = 100))
{
  lines(x1, y1 + i, col = hsv(runif(1,.65,.7), 1, 1, runif(1,.7)), 
        lwd = 4 * runif(1, 0.3))
  lines(x2, y2 + i, col = hsv(runif(1,.65,.7), 1, 1, runif(1,.7)), 
        lwd = 4 * runif(1, 0.3))
}

# signature
legend("bottomright", legend = "© Gaston Sanchez", bty = "n", text.col = "gray70")


#####

# generate pairs of x-y values
theta = seq(-2 * pi, 2 * pi, length = 300)
x = cos(theta)
y = x + sin(theta) 

# set graphical parameters
op = par(bg = "black", mar = rep(0.1, 4))

# plot
plot(x, y, type = "n", xlim = c(-8, 8), ylim = c(-1.5, 1.5))
for (i in seq(-2*pi, 2*pi, length = 100))
{
  lines(i*x, y, col = hsv(runif(1, 0.85, 0.95), 1, 1, runif(1, 0.2, 0.5)), 
        lwd = sample(seq(.5, 3, length = 10), 1))          
}

# signature
legend("bottomright", legend = "© Gaston Sanchez", bty = "n", text.col = "gray70")
 

#####

# Get data:
library(gapminder)

# Charge libraries:
library(ggplot2)
#devtools::install_github("dgrtwo/gganimate")
library(gganimate)

# Make a ggplot, but add frame=year: one image per year
p <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, color = continent, frame = year)) +
  geom_point() +
  scale_x_log10() +
  theme_bw()

# Make the animation!ç
gganimate(p)

# Save it to Gif
gganimate(p, "#271_gganimate.gif")
