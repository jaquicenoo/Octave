%Ejemplo simple PSO

clc
close all
clear all

%Configuracion del algoritmo PSO
parametros = OptionsPSO('num',30,'chi',1,'w',0.729,'c1',1.494,'c2',1.494,'MaxIter',2000,'ShowIter',0);

%Limites de busqueda
bounds = [-2*ones(10,1) 2*ones(10,1)];

%Optimizacion empleando PSOalg
[x,f,gen]=PSOalg(@rastriginsfcn,bounds,parametros)

