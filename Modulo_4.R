#Taller m�dulo 4 ----
#Integrantes: Luisa Aguilar, Paola Erazo y Sandra Garzon ----

library(ggplot2)

Spotify<- read.csv("C:/Users/Usuario/Downloads/songs_normalize.csv")

#Punto 1. Gr�fico de Dispersion ----
grafico_dispersion <- ggplot(Spotify, aes(x = danceability, y = valence)) +
  geom_point(color = "blue", alpha = 0.3)

#Punto 2. Boxplot ----
grafico_boxplot <-ggplot(Spotify, aes(x=factor(mode), y=energy, color=factor(mode))) +
  geom_boxplot()+
  theme(
    legend.position = 'none'
  )

#Punto 3. Composici�n con Patchwork ----
library(patchwork)
grafico_dispersion + grafico_boxplot
