%Ejemplo simple GA

clc
close all
clear all

%Configuracion del algoritmo GA
parametros = OptionsGA('tolerance',1e-10,'popSize',40,'generationsNum',1000,'crossProb',0.9,'mutateProb',0.1,'ShowIter',0);

%Limites de busqueda
bounds = [-2*ones(10,1) 2*ones(10,1)];

%Optimizacion empleando GAalg
[x,fmin]=GAalg(@rastriginsfcn,bounds,parametros)
