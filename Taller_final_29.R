##Trabajo Final ----
##Integrantes: Luisa Aguilar, Paola Erazo y Sandra Garzon 

##Parte 1. Fundamentos de R -----

#Punto 1.1 Loop If

calificacion <- 0
if (calificacion < 10) {
  print('¡Hay mucho por mejorar!')
} else if (calificacion >= 10 & calificacion < 20){
  print("¡Bien! Pero podría ser excelente.")
} else {
  print("¡Excelente Servicio!")
}

#Punto 1.2 Funciones 

calificacion_final<- function(Calidad=10,Decoracion=5, Servicio=15) {
  suma= Calidad + Decoracion + Servicio
  return(suma)
}

calificacion_final(,1,3)

# Parte 2. Tidyverse ----
price<-read.csv("C:/Users/Usuario/Downloads/price_ratings.csv")
restaurant<-read.csv("C:/Users/Usuario/Downloads/restaurant_locations.csv")


#Punto 2.1 Cargar datos
str(price)
head(price, 8)
#La base de datos price cuenta con tres variables, dos de tipo interger (int), que son números enteros y una variable caracter. 
str(restaurant)
head(restaurant, 8)
# El data frame restaurant, se compone por 3 variables y al igual que la base price, dos son de tipo interger y una character. 

#Los dos dataframes sí cumplen con que cada columna es una variable y cada fila una observacion. 


#Punto 2.2 Pivot
library(tidyverse)
prueba_wider <- price %>%
  pivot_wider(names_from = Variable, values_from = Valor )
#El dataframe resultante tiene 168 observaciones  y 5 variables, las cuales son Id, Price, Food, Decor y Service.


#Punto 2.3 Joins

resultado_inner <- prueba_wider %>%
  inner_join(restaurant, by =c("Id"= "Id_restaurant"))
#Se obtiene como resultado una interseccion de las dos tablas de 168 observaciones y 5 variables

#Punto 2.4 Select y arrange
Orden_precio <- resultado_inner %>%
  select(c(Restaurant,Price,Service)) %>%
  arrange(desc(Price))
#El restaurante más caro, de acuerdo a lo suministrado es Harry Cipriani con un precio de 65 y un servicio de 20. 
#Seguido por los restaurantes Rainbow Grill y San Domenico con un servicio de 65.  
arrange(Orden_precio, Price)
#El restaurante más barato es Lamarca con un precio de 19 y un servicio de 15

#Punto 2.5 Group_by y Summarise

Precio_Comida <- resultado_inner %>%
  group_by(East) %>%
  summarise(precio_comida=mean(Food))
#Sí se considera que 0 representa el oeste de la ciudad y 1 representa el este de Manhattan, la comida sí es más costosa en el este con un porcentaje de 20.9


##Parte 3. Análisis estadístico ----

#Punto 3.1. Regresión lineal 

regresion = lm((Price~Food+Decor+Service+East),
                     data= resultado_inner)

summary(regresion)
#Se obtiene un valor bajo de dentro del p-value lo que indica que hay una relacion entre la variable de respuesta y las variables predictoras, aunque no todas las variables son significativas como lo es Service. 
#La variable que influye mayormente dentro del precio de la comida es East


##Parte 4. Visualización de datos ----

#Punto 4.1. Gráfico de Densidad
library(ggplot2)
Grafico_Densidad <- ggplot(resultado_inner, aes(Service, linetype = factor(East)))+
  geom_density()+
  labs(
    title = "Grafico de Densidad",
    x = "Servicio",
    y = "Densidad",
    linetype = "Este"
  )
#Dentro del grafico se observa que la zona Este de Manhattan es la que mejor calificación de servicio obtuvo dentro de la muestra


#Punto 4.2. Gráfico de Dispersión

Grafico_Dispersion<- ggplot(resultado_inner, aes(x=Price, y=Decor, color = factor(East)))+
  geom_point()+
  scale_color_manual(
    labels= c("Oeste",
              "Este"),
    values = c("blue",
               "green")
  )
#Se concluye que el restaurante con menor precio pertenece a la zona Oeste