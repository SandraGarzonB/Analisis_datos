#Taller módulo 1 ----
##Integrantes: Luisa Aguilar, Paola Erazo y Sandra Garzon ----

# Punto 1: vectores y listas ----
## Numeral A 
## Se diferencia en que la lista me permite agrupar los elementos de diferente tipo
mi_vector_nuevo <- c(TRUE, 5, 3, "hola")
mi_lista <- list(FALSE, 3, 10, "adios")
## Numeral B
## Mediante los cuadrados dobles se extrae elementos, cuadrados simples se extrae el elemento con lista
mi_lista1 <- l1[1]
mi_lista2 <- l1[[1]]


# Punto 2: Extraccion de elementos ----

matriz <- matrix(rep(1:7, 4), ncol = 4, nrow = 7, byrow = TRUE)

install.packages("tidyverse")
library(tidyverse)

apply(matriz, 1, mean)
data <- as_tibble(mtcars)

# Solución:
## Literal a.
colnames(data)
select(data, cyl)

## Literal b.

tercera_fila <- matriz [3,]

## Literal c.
slice(data, 3:7)

## Literal d.

matriz_d <-matriz [1:2,2:4]


# Punto 3: If ----

i <- 25

if (i %% 2 == 0) {
  print("par")
} else {
  print("impar")
}


# Punto 4:For ----

library(tidyverse)
nombres <- c("Andrea", "Carlos", "Juan", "Carolina", "Fernando", "Laura")


for (nombre in nombres) {
  print(paste("Bienvenido", nombre))
}


# Punto 5: Funciones ----
a<- 2
b<- 0

elevar<- function(a,b) {
  if (b==0)
    return(1)
  return(a^b)
}

elevar(a,b)
