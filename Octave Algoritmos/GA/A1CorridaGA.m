clc
clear all
close all

%%%%%Ejecución del algoritmo GA%%%%%

%Número de dimensiones 
dims = 10;

%Ciclo principal: Tipo de funcion objetivo
for CasoF =1:8

    %Funciones de prueba
    FuncionesPrueba;

    %Rango del espacio de busqueda
    bounds = [-RangeO/2*ones(dims,1),RangeO/2*ones(dims,1)];

    %Ciclo para el tipo de algoritmo PSO
    for Confi = 1:2

        %%Tipo de GA:
        switch Confi
            case 1
            %Caso 1:
            PopSize = 50;
            CrossProb = 0.6;
            MutateProb = 0.001;
            case 2
            %Caso 2:
            PopSize = 30;
            CrossProb = 0.9;
            MutateProb = 0.01;
            otherwise
            %Caso 3:
            PopSize = 40;
            CrossProb = 0.9
            MutateProb = 0.1;
        end

        %Configuracion y parametros del algoritmo
        parametros = OptionsGA('tolerance',1e-10,'popSize',PopSize,'generationsNum',2000,'crossProb',CrossProb,'mutateProb',MutateProb,'ShowIter',0);       
        
        %Nombre para guardar la variable
        fname = ['GA',num2str(Confi),'Fobj',num2str(CasoF)]

        %Recoleccion de datos
        for ni = 1:50
        disp(['Ejecución: ',num2str(ni)]);

        %Run GA
        tic
        [x,fmin]=GAalg(FunObj,bounds,parametros);        
        tn = toc;

        %Datos y almacenamiento de variables
        DatK(ni) = 2000;
        DatF(ni) = fmin;
        DatP(ni,:) = x;
        DatT(ni) = tn;
        
        %Guardar las variables
        save(fname,'DatK','DatF','DatP','DatT');
        end
    end
end

