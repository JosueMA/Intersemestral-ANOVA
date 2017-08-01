# Intersemestral-ANOVA

Aquí podrás encontrar todo el material del curso.

Para instalar todos los paquetes que usaremos en el curso, corran la siguiente serie de comandos en su consola de RStudio:

```
ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if(length(new.pkg)) install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

# load packages

packages <- c("tidyverse", "psych", "foreign", "multcomp", "car", "mosaic", "statisticalModeling", "plotly", "ggthemes", "markdown", "rmarkdown", "shiny", "learnr")

ipak(packages)
```


### Cuestionarios

https://goo.gl/forms/Xjos2ltfkRzzgSkM2


#### Links útiles

* Descargar R: https://cran.r-project.org
* Descargar RStudio: https://www.rstudio.com/products/rstudio/download/
* Tidyverse: http://tidyverse.org
* Página de Andy Field: https://www.discoveringstatistics.com
* Personality Project (`psych`): http://personality-project.org/r/psych/
* Curso Introductiorio a R: https://www.datacamp.com/community/open-courses/introduccion-a-r#gs.esqkJnM
* Página para explorar paquetes disponibles (se recomienda explorar por tarea): https://www.rdocumentation.org

**Contacto:**

Said: said.ejp@gmail.com; Josué: rjmdzar@gmail.com; Diego: diego.angeles.valdez@gmail.com
