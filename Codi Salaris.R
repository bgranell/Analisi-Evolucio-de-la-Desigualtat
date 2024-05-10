install.packages("dplyr")
library(readxl)
library(ggplot2)
library(dplyr)

estadístics_salaris <- read_excel("C:/Users/admin/Desktop/Inquietdus Programació/Distribució Salaris/Dades distribució Salaris.xlsx")
estadístics_salaris

# Filtro pels estadístics del Total Nacional des del 2008 fins al 2021 i ho tradueixo
estadístics_Nacionals <- estadístics_salaris[estadístics_salaris$Entidad == "Total Nacional",]
estadístics_Nacionals <- rename(estadístics_Nacionals, Any = Año)
estadístics_Nacionals <- rename(estadístics_Nacionals, Entitat = Entidad)
estadístics_Nacionals <- rename(estadístics_Nacionals, Mitjana = Media)
estadístics_Nacionals <- rename(estadístics_Nacionals, Q.inf = "Cuartil inferior")
estadístics_Nacionals <- rename(estadístics_Nacionals, Q.sup = "Cuartil superior")
estadístics_Nacionals <- rename(estadístics_Nacionals, Perc.10 = "Percentil 10")
estadístics_Nacionals <- rename(estadístics_Nacionals, Perc.90 = "Percentil 90")


# Ho ordeno de data més antiga a més recent

estadístics_Nacionals <- estadístics_Nacionals[order(estadístics_Nacionals$Any), ]

estadístics_Nacionals

# Calcularé les taxes mitjanes de creixement pels diferents grups

increment_percentual <- function(x){
  (x-lag(x))/lag(x)*100
  }

estadístics_Nacionals <- mutate(estadístics_Nacionals, I.10 = increment_percentual(Perc.10))
estadístics_Nacionals <- mutate(estadístics_Nacionals, I.Q.inf = increment_percentual(Q.inf))
estadístics_Nacionals <- mutate(estadístics_Nacionals, I.Mediana = increment_percentual(Mediana))
estadístics_Nacionals <- mutate(estadístics_Nacionals, I.Mitjana = increment_percentual(Mitjana))
estadístics_Nacionals <- mutate(estadístics_Nacionals, I.Q.sup = increment_percentual(Q.sup))
estadístics_Nacionals <- mutate(estadístics_Nacionals, I.90 = increment_percentual(Perc.90))

estadístics_Nacionals

creixement_mitjà_10 <- mean(na.omit(estadístics_Nacionals$I.10))
creixement_mitjà_Q.inf <- mean(na.omit(estadístics_Nacionals$I.Q.inf))
creixement_mitjà_Mediana <- mean(na.omit(estadístics_Nacionals$I.Mediana))
creixement_mitjà_Mitjana <- mean(na.omit(estadístics_Nacionals$I.Mitjana))
creixement_mitjà_Q.sup <- mean(na.omit(estadístics_Nacionals$I.Q.sup))
creixement_mitjà_90 <- mean(na.omit(estadístics_Nacionals$I.90))

# Ara calcularé els increments absoluts per cada grup

Perc.10_2021 = estadístics_Nacionals[14,4]
Perc.10_2008 = estadístics_Nacionals[1,4]

diferència_Perc.10 <- Perc.10_2021 - Perc.10_2008
diferència_Perc.10



Q.inf_2021 = estadístics_Nacionals[14,5]
Q.inf_2008 = estadístics_Nacionals[1,5]

diferència_Q.inf <- Q.inf_2021 - Q.inf_2008
diferència_Q.inf


Mediana_2021 = estadístics_Nacionals[14,6]
Mediana_2008 = estadístics_Nacionals[1,6]

diferència_Mediana <- Mediana_2021 - Mediana_2008
diferència_Mediana



Mitjana_2021 = estadístics_Nacionals[14,3]
Mitjana_2008 = estadístics_Nacionals[1,3]

diferència_Mitjana <- Mitjana_2021 - Mitjana_2008
diferència_Mitjana



Q.sup_2021 = estadístics_Nacionals[14,7]
Q.sup_2008 = estadístics_Nacionals[1,7]

diferència_Q.sup <- Q.sup_2021 - Q.sup_2008
diferència_Q.sup


Perc.90_2021 = estadístics_Nacionals[14,8]
Perc.90_2008 = estadístics_Nacionals[1,8]

diferència_Perc.90 <- Perc.90_2021 - Perc.90_2008
diferència_Perc.90



# Ara compararé tant les taxes mitjanes de creixement com l'increment absolut mensual per cada grup

dades_10<- sprintf("Percentil 10 -> La taxa mitjana de creixement anual es %0.2f i l'increment absolut anual és %0.2f ", creixement_mitjà_10, diferència_Perc.10)
dades_10

dades_Q.inf <- sprintf("Quartil inferior -> La taxa mitjana de creixement anual es %0.2f i l'increment absolut anual és %0.2f ", creixement_mitjà_Q.inf, diferència_Q.inf)
dades_Q.inf

dades_Mediana <- sprintf("Mediana -> La taxa mitjana de creixement anual es %0.2f i l'increment absolut anual és %0.2f ", creixement_mitjà_Mediana, diferència_Mediana)
dades_Mediana

dades_Mitjana <- sprintf("Mitjana -> La taxa mitjana de creixement anual es %0.2f i l'increment absolut anual és %0.2f ", creixement_mitjà_Mitjana, diferència_Mitjana)
dades_Mitjana

dades_Q.sup <- sprintf("Quartil superior -> La taxa mitjana de creixement anual es %0.2f i l'increment absolut anual és %0.2f ", creixement_mitjà_Q.sup, diferència_Q.sup)
dades_Q.sup

dades_90 <- sprintf("Percentil 90 -> La taxa mitjana de creixement anual es %0.2f i l'increment absolut anual és %0.2f ", creixement_mitjà_90, diferència_Perc.90)
dades_90




# Dos dades de l'evolució de la desigualtat

ràtio90_mediana <- diferència_Perc.90/diferència_Mediana

ràtio90_10 <- diferència_Perc.90/diferència_Perc.10


diferència_90_10 <- sprintf("L'increment salarial del Percentil 90 és %0.2f vegades l'increment salarial del Percentil 10", diferència_Perc.90/diferència_Perc.10)
diferència_90_10

diferència_90_mediana <- sprintf("L'increment salarial del Percentil 90 és %0.2f vegades l'increment salarial de la Mediana", diferència_Perc.90/diferència_Mediana)
diferència_90_mediana
