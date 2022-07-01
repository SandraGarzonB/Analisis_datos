#Taller módulo 1 ----
##Integrantes: Luisa Aguilar, Paola Erazo y Sandra Garzon ----


# Punto 1: vectores y listas ----
## Numeral A 
## Se diferencia en que la lista me permite agrupar elementos como objetos o de diferente tipo
mi_vector_nuevo <- c(TRUE, 5, 3, "hola")
mi_lista <- list(FALSE, mi_vector_nuevo, 3, 10, "adios")
## Numeral B
## Mediante los paréntesis cuadrados dobles se extrae elementos y mediante los cuadrados simples se extrae el elemento con la lista
mi_lista1 <- l1[1]
mi_lista2 <- l1[[1]]


# Punto 2: Extraccion de elementos ----

matriz <- matrix(rep(1:7, 4), ncol = 4, nrow = 7, byrow = TRUE)

# Solución:
## Literal a.
columna_2 <- matriz [,2]

## Literal b.

tercera_fila <- matriz [3,]

## Literal c.
matriz_c <- matriz[3:7,]

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

nombres <- c("Andrea", "Carlos", "Juan", "Carolina", "Fernando", "Laura")


for (nombre in nombres) {
  print(paste("Bienvenido", nombre))
}


# Punto 5: Funciones ----

elevar<- function(a,b=1) {
  return(a^b)
}

respuesta<-elevar(5,3)

