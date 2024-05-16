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
estadístics_Nacionals <- rename(estadístics_Nacionals, Mitjana_TN = Media)
estadístics_Nacionals <- rename(estadístics_Nacionals, Q.inf_TN = "Cuartil inferior")
estadístics_Nacionals <- rename(estadístics_Nacionals, Q.sup_TN = "Cuartil superior")
estadístics_Nacionals <- rename(estadístics_Nacionals, Perc.10_TN = "Percentil 10")
estadístics_Nacionals <- rename(estadístics_Nacionals, Perc.90_TN = "Percentil 90")
estadístics_Nacionals <- rename(estadístics_Nacionals, Mediana_TN = Mediana)

# Ho ordeno de data més antiga a més recent

estadístics_Nacionals <- estadístics_Nacionals[order(estadístics_Nacionals$Any), ]

estadístics_Nacionals

# Calcularé les taxes mitjanes de creixement pels diferents grups

increment_percentual <- function(x){
  (x-lag(x))/lag(x)*100
  }

estadístics_Nacionals <- mutate(estadístics_Nacionals, I.10_TN = increment_percentual(Perc.10_TN))
estadístics_Nacionals <- mutate(estadístics_Nacionals, I.Q.inf_TN = increment_percentual(Q.inf_TN))
estadístics_Nacionals <- mutate(estadístics_Nacionals, I.Mediana_TN = increment_percentual(Mediana_TN))
estadístics_Nacionals <- mutate(estadístics_Nacionals, I.Mitjana_TN = increment_percentual(Mitjana_TN))
estadístics_Nacionals <- mutate(estadístics_Nacionals, I.Q.sup_TN = increment_percentual(Q.sup_TN))
estadístics_Nacionals <- mutate(estadístics_Nacionals, I.90_TN = increment_percentual(Perc.90_TN))

estadístics_Nacionals

creixement_mitjà_10_TN <- mean(na.omit(estadístics_Nacionals$I.10_TN))
creixement_mitjà_Q.inf_TN <- mean(na.omit(estadístics_Nacionals$I.Q.inf_TN))
creixement_mitjà_Mediana_TN <- mean(na.omit(estadístics_Nacionals$I.Mediana_TN))
creixement_mitjà_Mitjana_TN <- mean(na.omit(estadístics_Nacionals$I.Mitjana_TN))
creixement_mitjà_Q.sup_TN <- mean(na.omit(estadístics_Nacionals$I.Q.sup_TN))
creixement_mitjà_90_TN <- mean(na.omit(estadístics_Nacionals$I.90_TN))

# Ara calcularé els increments absoluts per cada grup

Perc.10_2021_TN = estadístics_Nacionals[14,4]
Perc.10_2008_TN = estadístics_Nacionals[1,4]

diferència_Perc.10_TN <- Perc.10_2021_TN - Perc.10_2008_TN
diferència_Perc.10_TN



Q.inf_2021_TN = estadístics_Nacionals[14,5]
Q.inf_2008_TN = estadístics_Nacionals[1,5]

diferència_Q.inf_TN <- Q.inf_2021_TN - Q.inf_2008_TN
diferència_Q.inf_TN


Mediana_2021_TN = estadístics_Nacionals[14,6]
Mediana_2008_TN = estadístics_Nacionals[1,6]

diferència_Mediana_TN <- Mediana_2021_TN - Mediana_2008_TN
diferència_Mediana_TN



Mitjana_2021_TN = estadístics_Nacionals[14,3]
Mitjana_2008_TN = estadístics_Nacionals[1,3]

diferència_Mitjana_TN <- Mitjana_2021_TN - Mitjana_2008_TN
diferència_Mitjana_TN



Q.sup_2021_TN = estadístics_Nacionals[14,7]
Q.sup_2008_TN = estadístics_Nacionals[1,7]

diferència_Q.sup_TN <- Q.sup_2021_TN - Q.sup_2008_TN
diferència_Q.sup_TN


Perc.90_2021_TN = estadístics_Nacionals[14,8]
Perc.90_2008_TN = estadístics_Nacionals[1,8]

diferència_Perc.90_TN <- Perc.90_2021_TN - Perc.90_2008_TN
diferència_Perc.90_TN



# Ara compararé tant les taxes mitjanes de creixement com l'increment absolut mensual per cada grup

dades_10_TN<- sprintf("Percentil 10 | Total Nacional -> La taxa mitjana de creixement anual es %0.2f i l'increment absolut del salari és %0.2f ", creixement_mitjà_10_TN, diferència_Perc.10_TN)
dades_10_TN

dades_Q.inf_TN <- sprintf("Quartil inferior | Total Nacional -> La taxa mitjana de creixement anual es %0.2f i l'increment absolut del salari és %0.2f ", creixement_mitjà_Q.inf_TN, diferència_Q.inf_TN)
dades_Q.inf_TN

dades_Mediana_TN <- sprintf("Mediana | Total Nacional -> La taxa mitjana de creixement anual es %0.2f i l'increment absolut del salari és %0.2f ", creixement_mitjà_Mediana_TN, diferència_Mediana_TN)
dades_Mediana_TN

dades_Mitjana_TN <- sprintf("Mitjana | Total Nacional -> La taxa mitjana de creixement anual es %0.2f i l'increment absolut del salari és %0.2f ", creixement_mitjà_Mitjana_TN, diferència_Mitjana_TN)
dades_Mitjana_TN

dades_Q.sup_TN <- sprintf("Quartil superior | Total Nacional -> La taxa mitjana de creixement anual es %0.2f i l'increment absolut del salari és %0.2f ", creixement_mitjà_Q.sup_TN, diferència_Q.sup_TN)
dades_Q.sup_TN

dades_90_TN <- sprintf("Percentil 90 | Total Nacional -> La taxa mitjana de creixement anual es %0.2f i l'increment absolut del salari és %0.2f ", creixement_mitjà_90_TN, diferència_Perc.90_TN)
dades_90_TN


# Dos dades de l'evolució de la desigualtat

ràtio90_mediana_TN <- sprintf("A ESPANYA, l'increment salarial del Percentil 90 és %0.2f vegades l'increment salarial del Percentil 10", diferència_Perc.90_TN/diferència_Perc.10_TN)
ràtio90_mediana_TN

ràtio90_10_TN <- sprintf("A ESPANYA, l'increment salarial del Percentil 90 és %0.2f vegades l'increment salarial de la Mediana", diferència_Perc.90_TN/diferència_Mediana_TN)
ràtio90_10_TN

# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Ara faré el mateix per Catalunya ##


# Filtro pels estadístics del Total Nacional des del 2008 fins al 2021 i ho tradueixo
estadístics_CAT <- estadístics_salaris[estadístics_salaris$Entidad == "Cataluña",]
estadístics_CAT <- rename(estadístics_CAT, Any = Año)
estadístics_CAT <- rename(estadístics_CAT, Entitat = Entidad)
estadístics_CAT <- rename(estadístics_CAT, Mitjana_CAT = Media)
estadístics_CAT <- rename(estadístics_CAT, Q.inf_CAT = "Cuartil inferior")
estadístics_CAT <- rename(estadístics_CAT, Q.sup_CAT = "Cuartil superior")
estadístics_CAT <- rename(estadístics_CAT, Perc.10_CAT = "Percentil 10")
estadístics_CAT <- rename(estadístics_CAT, Perc.90_CAT = "Percentil 90")
estadístics_CAT <- rename(estadístics_CAT, Mediana_CAT = Mediana)

# Ho ordeno de data més antiga a més recent

estadístics_CAT <- estadístics_CAT[order(estadístics_CAT$Any), ]

estadístics_CAT

# Calcularé les taxes mitjanes de creixement pels diferents grups

increment_percentual <- function(x){
  (x-lag(x))/lag(x)*100
}

estadístics_CAT <- mutate(estadístics_CAT, I.10_CAT = increment_percentual(Perc.10_CAT))
estadístics_CAT <- mutate(estadístics_CAT, I.Q.inf_CAT = increment_percentual(Q.inf_CAT))
estadístics_CAT <- mutate(estadístics_CAT, I.Mediana_CAT = increment_percentual(Mediana_CAT))
estadístics_CAT <- mutate(estadístics_CAT, I.Mitjana_CAT = increment_percentual(Mitjana_CAT))
estadístics_CAT <- mutate(estadístics_CAT, I.Q.sup_CAT = increment_percentual(Q.sup_CAT))
estadístics_CAT <- mutate(estadístics_CAT, I.90_CAT = increment_percentual(Perc.90_CAT))


estadístics_CAT

creixement_mitjà_10_CAT <- mean(na.omit(estadístics_CAT$I.10_CAT))
creixement_mitjà_Q.inf_CAT <- mean(na.omit(estadístics_CAT$I.Q.inf_CAT))
creixement_mitjà_Mediana_CAT <- mean(na.omit(estadístics_CAT$I.Mediana_CAT))
creixement_mitjà_Mitjana_CAT <- mean(na.omit(estadístics_CAT$I.Mitjana_CAT))
creixement_mitjà_Q.sup_CAT <- mean(na.omit(estadístics_CAT$I.Q.sup_CAT))
creixement_mitjà_90_CAT <- mean(na.omit(estadístics_CAT$I.90_CAT))

# Ara calcularé els increments absoluts per cada grup

Perc.10_2021_CAT = estadístics_CAT[14,4]
Perc.10_2008_CAT = estadístics_CAT[1,4]

diferència_Perc.10_CAT <- Perc.10_2021_CAT - Perc.10_2008_CAT
diferència_Perc.10_CAT



Q.inf_2021_CAT = estadístics_CAT[14,5]
Q.inf_2008_CAT = estadístics_CAT[1,5]

diferència_Q.inf_CAT <- Q.inf_2021_CAT - Q.inf_2008_CAT
diferència_Q.inf_CAT


Mediana_2021_CAT = estadístics_CAT[14,6]
Mediana_2008_CAT = estadístics_CAT[1,6]

diferència_Mediana_CAT <- Mediana_2021_CAT - Mediana_2008_CAT
diferència_Mediana_CAT



Mitjana_2021_CAT = estadístics_CAT[14,3]
Mitjana_2008_CAT = estadístics_CAT[1,3]

diferència_Mitjana_CAT <- Mitjana_2021_CAT - Mitjana_2008_CAT
diferència_Mitjana_CAT



Q.sup_2021_CAT = estadístics_CAT[14,7]
Q.sup_2008_CAT = estadístics_CAT[1,7]

diferència_Q.sup_CAT <- Q.sup_2021_CAT - Q.sup_2008_CAT
diferència_Q.sup_CAT


Perc.90_2021_CAT = estadístics_CAT[14,8]
Perc.90_2008_CAT = estadístics_CAT[1,8]

diferència_Perc.90_CAT <- Perc.90_2021_CAT - Perc.90_2008_CAT
diferència_Perc.90_CAT



# Ara compararé tant les taxes mitjanes de creixement com l'increment absolut mensual per cada grup

dades_10_CAT<- sprintf("Percentil 10 | CATALUNYA -> La taxa mitjana de creixement anual es %0.2f i l'increment absolut del salari és %0.2f ", creixement_mitjà_10_CAT, diferència_Perc.10_CAT)
dades_10_CAT

dades_Q.inf_CAT <- sprintf("Quartil inferior | CATALUNYA -> La taxa mitjana de creixement anual es %0.2f i l'increment absolut del salari és %0.2f ", creixement_mitjà_Q.inf_CAT, diferència_Q.inf_CAT)
dades_Q.inf_CAT

dades_Mediana_CAT <- sprintf("Mediana | CATALUNYA -> La taxa mitjana de creixement anual es %0.2f i l'increment absolut del salari és %0.2f ", creixement_mitjà_Mediana_CAT, diferència_Mediana_CAT)
dades_Mediana_CAT

dades_Mitjana_CAT <- sprintf("Mitjana | CATALUNYA -> La taxa mitjana de creixement anual es %0.2f i l'increment absolut del salari és %0.2f ", creixement_mitjà_Mitjana_CAT, diferència_Mitjana_CAT)
dades_Mitjana_CAT

dades_Q.sup_CAT <- sprintf("Quartil superior | CATALUNYA -> La taxa mitjana de creixement anual es %0.2f i l'increment absolut del salari és %0.2f ", creixement_mitjà_Q.sup_CAT, diferència_Q.sup_CAT)
dades_Q.sup_CAT

dades_90_CAT <- sprintf("Percentil 90 | CATALUNYA -> La taxa mitjana de creixement anual es %0.2f i l'increment absolut del salari és %0.2f ", creixement_mitjà_90_CAT, diferència_Perc.90_CAT)
dades_90_CAT


# Dos dades de l'evolució de la desigualtat

ràtio90_10_CAT <- sprintf("A CATALUNYA, l'increment salarial del Percentil 90 és %0.2f vegades l'increment salarial del Percentil 10", diferència_Perc.90_CAT/diferència_Perc.10_CAT)
ràtio90_10_CAT

ràtio90_mediana_CAT <- sprintf("A CATALUNYA, l'increment salarial del Percentil 90 és %0.2f vegades l'increment salarial de la Mediana", diferència_Perc.90_CAT/diferència_Mediana_CAT)
ràtio90_mediana_CAT


# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Ara ho sintetitzo en un 3 data frames ##

# El primer data frame ens mostra la taxa mitjana de creixement anual del període 2008 - 2021 de cada grup percentil.
# (tot i les taxes mitjanes de creixement similars, veurem que no per això la desigualtat deixa d'augmentar)
Comparació_Taxa_Creixement_Mitjana_CAT_TN <- data.frame(
  "Grup salarial" = c("Percentil 10", "Q. inferior", "Mediana", "Mitjana", "Q. superior", "Percentil 90"),
  "Taxa Increment Catalunya" = c(1.42, 1.14, 1.45, 1.45, 1.60, 1.54),
  "Taxa Increment Total Nacional" = c(1.13, 1.03, 1.33, 1.31, 1.45, 1.45))

Comparació_Taxa_Creixement_Mitjana_CAT_TN


# El segon data frame  ens mostra l'increment absolut del salari anual entre 2008 i 2021 de cada grup percentil
# (El percentil 10 català cobra 1.677,30 euros més l'any 2021 que al 2008, el percentil 90 català cobra 8.861,37 euros més,
# incrementa la desigualtat entre els dos grups)
Comparació_Increment_Absolut_CAT_TN <- data.frame(
  "Grup salarial" = c("Percentil 10", "Q. inferior", "Mediana", "Mitjana", "Q. superior", "Percentil 90"),
  "Increment Catalunya" = c(1677.30, 2192.59, 4057.92, 4769.48, 6541.49, 8861.37),
  "Increment Nacional" = c(1288.86, 1872.50, 3394.29, 4013.40, 5511.43, 7872.07))

Comparació_Increment_Absolut_CAT_TN


# El tercer data frame ens mostra el ràtio de l'increment dels salaris absolut entre el percentil 90 amb el percentil 10 i la mediana
# (es dir, quantes vegades creix més ràpid el salari del percentil 90 comparat amb el percentil 10 i la mediana)
Comparació_Increment_Desigualtat_CAT_TN <- data.frame(
  "Ràtio increment" = c("Ràtio Percentils 90 - 10", "Ràtio 90 - Mediana"),
  "Catalunya" = c(5.28, 2.18),
  "Total Nacional" = c(6.11, 2.32))

Comparació_Increment_Desigualtat_CAT_TN