#Ejercicios Módulo 2 -----
#Integrantes: Luisa Aguilar, Paola Erazo y Sandra Garzón -----

# Punto 1: Cargar y explorar datos ----

#install.packages("tidyverse")
data<-read.csv("C:/Users/Usuario/Downloads/all_csv sorted.csv")
library(tidyverse)
str(data)
head(data, 10)


# Punto 2: Datos faltantes ----
library(naniar)

datos_faltantes<-miss_var_summary(data)
n_miss(data)
miss_case_summary(data)
vis_miss(data, cluster = TRUE)
miss_scan_count(data, search = " ")

#Punto 3: Manipulación de datos pt.1 ----

#Se observa dentro de la exploración que las variables de precio promedio de 1GB a inicios de 2020, precio promedio de 1GB a inicios de 2021,
#Usuarios de internet y población que son de tipo caracter lo que no permite que se puedan realizar operaciones aritmeticas, por tanto, se realiza una conversion de los datos a númericos

#data$Average.price.of.1GB..USD..at.the.start.of.2021.<- as.numeric(data$Average.price.of.1GB..USD..at.the.start.of.2021.)
#data$Average.price.of.1GB..USD.â...at.start.of.2020. <- as.numeric(data$Average.price.of.1GB..USD.â...at.start.of.2020.)
data$Internet.users <- as.numeric(gsub(",", "", data$Internet.users))
data$Population <- as.numeric(gsub(",", "", data$Population))

#Para la variables de usuarios de internet y poblacion se usa gsub para oder cambiar la coma por punto como separador de miles

#Se realiza transformaciones con los NA dentro de algunas variables de la base, estos NA se cambiar por el valor 0, ya que son variables númericas. 
base_nueva <- data %>%
  mutate(Avg_Mbits = replace_na(Avg...Mbit.s.Ookla, 0)) %>%
  mutate(Precio_2021 = replace_na(Average.price.of.1GB..USD..at.the.start.of.2021., 0))%>%
  mutate(Precio_2020= replace_na(Average.price.of.1GB..USD.â...at.start.of.2020., 0))%>%
  mutate(Internet_user=replace_na(Internet.users,0))%>%
  mutate(Poblacion=replace_na(Population,0))

base_nueva<- base_nueva[,-c(9,10,11,12,13)]

#Cambio porcentual en el precio del internet entre 2020 y 2021 ----
base_nueva%>%
  mutate(cambio_precio = ((as.numeric(Precio_2021))- (as.numeric(Precio_2020))/(as.numeric(Precio_2020))*100))


#Punto 4: Manipulación de datos pt.2 


Velocidad_Megabits <- base_nueva %>%
  group_by(Continental.region) %>%
  summarise(velocidad_megabits = mean(Avg_Mbits)) %>%
  arrange(desc(velocidad_megabits))

#El continente con el Internet más lento es Oceanía con un porcentaje de velocidad de 6.08, al igual que Africa Subsahariana con una velocidad de 7.05 Megabits


#Punto 5: Gráfico en ggplot2 ----
Grafico<-base_nueva %>%
  mutate(Usuarios_porcentaje = Internet_user/Poblacion*100)

library(ggplot2)
ggplot(Grafico, aes(x=Avg_Mbits, y=Usuarios_porcentaje)) +
  geom_point(stat = "identity")

#Sí se evidencia una correlación entre ambas variables, se presenta una correlación alta ya que los usuarios aumentan en medida en que aumenta la velocidad del internet
