%Ejemplo simple DE

clc
close all
clear all

%Limites de busqueda
FVrminbound = [-10 -10 -10 -10 -10 -10 -10 -10 -10 -10];
FVrmaxbound = [ 10  10  10  10  10  10  10  10  10  10];
FVrbound = [FVrminbound' FVrmaxbound'];

%Opciones del algoritmo DE
parametros = OptionsDE('I_NP',20,'F_CR',0.95,'F_weight',0.8,'I_itermax',2000','I_strategy',1,'I_refresh',10,'ShowIter',0);

%Optimizacion empleando PDEalg
[FVr_x,FVr_oa,I_iter] = DEalg(@rastriginsfcn,FVrbound,parametros)

