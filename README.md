# Intersemestral-ANOVA

Aquí podrás encontrar todo el material del curso.
***

Para instalar todos los paquetes que usaremos en el curso, copien y luego corran la siguiente serie de comandos en la consola de RStudio:

```
# Función para instalar paquetes y cargarlos
ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if(length(new.pkg)) install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

# Paquetes a los cuales aplicar la función
packages <- c("tidyverse", "psych", "foreign", "multcomp", "car", "mosaic", "statisticalModeling", "plotly", "ggthemes", "markdown", "rmarkdown", "shiny", "learnr", "WRS2", "QuantPsyc", "datasauRus", "caret")

# Uso de la función
ipak(packages)
```

**Nota:** Les recomendamos resolver TODO el script `intro_to_r.R` antes de la clase de mañana; les ayudará a entender mejor el código que usemos a lo largo de la semana. Si tienen alguna duda (e.g., no saben qué son las listas, vectores o matrices), pueden consultar la parte correspondiente en el curso introductorio https://www.datacamp.com/community/open-courses/introduccion-a-r#gs.esqkJnM (dándole click a "Start Free Course") donde viene una explicación más detallada y ejercicios similares al script.

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
* Página para encontrar soluciones rápidas para tareas que quieran realizar en R: http://www.statmethods.net
* ¿Tienen problemas con la instalación o funciones y no saben qué hacer? Sitio útil para aclarar dudas: https://stackoverflow.com
* ¿Quieren hacer gráficas geniales con ggplot2? Aquí una lista muy completa de 50 ejemplos con su respectivo código: http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html
* Otra página con gráficas geniales y algunas visualizaciones artísticas: http://www.r-graph-gallery.com
* Galería de los principales tipos de documentos que pueden crear con RMarkdown: http://rmarkdown.rstudio.com/gallery.html

**Contacto:**

Said: said.ejp@gmail.com; Josué: rjmdzar@gmail.com; Diego: diego.angeles.valdez@gmail.com
