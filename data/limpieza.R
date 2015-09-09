# -----------------------------------------------------------------
#
#              L I M P I E Z A   D E   D A T O S
#
# -----------------------------------------------------------------

setwd('~/Projects/Politicas-Publicas/data/')

library(dplyr)
library(tidyr)
library(ggplot2)

# Datos de censos
poblacion  <- read.csv('poblacion.csv')
educacion  <- read.csv('educacion.csv')
salud      <- read.csv('salud.csv')
hogares    <- read.csv('hogares.csv')
viviendas  <- read.csv('viviendas.csv')
economia   <- read.csv('economia.csv')

# Quitaremos la variable OID, pues usaremos MANZANA como ID
educacion  <- educacion[ , -2]
salud      <- salud[ , -2]
viviendas  <- viviendas[ , -2]
economia   <- economia[ , -2]

# Uniremos los datos
censo <- inner_join(poblacion, educacion, by='MANZANA')
censo <- inner_join(censo, salud, by='MANZANA')
censo <- inner_join(censo, hogares, by='MANZANA')
censo <- inner_join(censo, viviendas, by='MANZANA')
censo <- inner_join(censo, economia, by='MANZANA')

# Eliminaremos de memoria los datos individuales
rm('poblacion', 'educacion', 'salud', 'hogares',
   'viviendas', 'economia')

# Leemos también los datos de negocios locales
DENUE <- read.csv('DENUE.csv')

