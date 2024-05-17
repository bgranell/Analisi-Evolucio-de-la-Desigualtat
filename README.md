INTRODUCCIÓ:
-
Anàlisi de l'evolució dels percentils dels salaris espanyols des de l'any 2008 fins al 2021, pel Total Nacional d'Espanya i desagregat per comunitats autònomes. La font es l'enquesta d'estructura salarial de l'INE.

L'objectiu és comparar l'evolució de les desigualtats existents en un període tant representatiu com han estat els 14 anys posteriors a la crisi del 2008.

Per analitzar l'evolució d'aquestes desigualtats ens valdrem tant d'increments relatius com de diferències absolutes dins de cadascun dels mateixos grups, representant la seva evolució en aquests 14 anys; i finalment d'una comparació entre grups, també en termes d'increment relatiu i absolut. Aquesta última fase ens permetrà posar en qüestió els nombres relatius en temes de desigualtat i convergència econòmica, ja sigui entre diferents regions o, com en aquest cas, entre percentils salarials diferents.

---------------------------------------------------------------------------------------------------------------
METODOLOGIA:
-
El primer pas és calcular l'increment relatiu anual de cada un dels 5 percentils (10 , 25, 50, 75, 90) i de la mitjana dels salaris del Total Nacional i l'expressem en forma de percentatge.
Acte seguit calcularem la mitjana de l'increment percentual per cadascun dels 6 grups.

El segon pas és calcular l'increment absolut de cada grup, es dir, la diferència entre els salaris del 2021 i dels del 2008, també per cadascun dels 6 grups.


El tercer pas és crear dos ràtios de comparació entre l'increment del percentil 90 i els increments dels dos percentils 10 i 50.

Repetirem els tres passos per les 14 observacions (2008 al 2021) relatives a Catalunya, i sintetitzarem tota la informació en 3 data-frames.
El primer mostrarà les taxes mitjanes de creixement de cada percentil, per cada regió.
El segon, els increments absoluts de cada percentil i l'increment de la seva distància amb el grup superior, per cada regió.
El tercer, els ràtios de l'increment del percentil 90 contra els increments dels percentils 10 i 50, per cada regió.
_______________________________________________________________________________________________________________
RESULTATS:
-
El primer data-frame, en referència a les taxes d'increment mitjanes, ens mostra que tots els grups percentils mostren un increment relatiu consistentment més gran a Catalunya que al total d'Espanya. Podem apreciar també que les taxes d'increment mitjanes a Espanya estan més correlacionades amb un grup percentil més alt que a Catalunya, on la correlació existeix però no és tant exagerada, ja que la diferència entre el percentil més alt i més baix és de 32 punts percentuals en el primer cas, i de 12 punts percentuals en el cas català.

Aquest primer data-frame ens porta a pensar que l'increment de la desigualtat catalana està per sota de la mitjana espanyola.

El segon data-frame ens mostra els increments salarials absoluts de cada grup percentil entre el 2008 i el 2021 de les dos regions. Podem veure a simple vista que hi ha una correlació positiva entre els increments absoluts i el grup percentil, que és indicador de que els grups percentils més alts perceben un increment absolut del seu salari més alt al llarg d'aquests 14 anys i, per tant, és indicador d'una desigualtat creixent. 

Per a fer un anàlisi més meticulós calculem la diferència entre els increments de cada grup per tal de quantificar aquest increment de la desigualtat.
En aquest anàlisi veiem que l'augment de la desigulatat avança més lentament entre els percentils 10 i 25 i entre el percentil 50 (la mediana) i la mitjana, situant-se en un increment del diferencial de salaris entre grups de 515,29 euros anuals i 711.56 euros anuals respectivament a Catalunya, i de 583.64 i 619.11 al total d'Espanya.
Els grups entre els quals la desigualtat avança més ràpidament són, de major a menor, els percentils 90 i 75, els percentils 50 i 25, i el percentil 75 i la mitjana; amb 2319.88 euros, 1865.33 euros i 1772.01 euros anuals respectivament pel cas català, i sent de 2360.64, 1521.79 i 1498.03 pel cas del total espanyol. 

Tot i que l'increment de la desigualtat existeix entre tots els grups percentils, l'increment de les diferències entre el percentil 90 i 75 és 4,50 vegades més gran que entre el percentil 10 i 25 a Catalunya i de 4,02 pel total espanyol, es dir, es produeix un increment de les diferències 4 vegades més gran entre les classes economiques més altes que entre les classes econòmiques més baixes, significant una concentració de capital provinent del treball dins del 10% més ric dels treballadors.


Per acabar, al tercer data-frame veiem que l'increment salarial del 10% més ric de la població és 5,28 vegades l'increment del 10% més pobre a Catalunya i 6,11 vegades entre els mateixos grups pel cas espanyol.
Comparat amb la mediana, aquest 10% de treballadros més ric veu incrementat el seu salari en 2,18 i 2,32 vegades el que incrementa el 10% més pobre.


Veiem així el perill que tenen les taxes de creixement anual per a comprovar la convergència salarial entre grups, ja que al ser calculats de froma relativa a ells mateixos, taxes d'increment similars poden amagar un augment de la diferència entre dos magnituds de partida molt allunyades entre si.
