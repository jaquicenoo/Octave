clc
clear all
close all

%%%%%Ejecución del algoritmo DE%%%%%

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
            PopSize = 48;
            CrossProb = 0.9784;
            Fweight = 0.6876;
            case 2
            %Caso 2:
            PopSize = 20;
            CrossProb = 1;
            Fweight = 0.85;
            otherwise
            %Caso 3:
            PopSize = 20;
            CrossProb = 0.95;
            Fweight = 0.8;
        end

        %Configuracion y parametros del algoritmo       
        parametros = OptionsDE('I_NP',PopSize,'F_CR',CrossProb,'F_weight',Fweight,'I_itermax',2000','I_strategy',1,'I_refresh',10,'ShowIter',0);
            
        %Nombre para guardar la variable
        fname = ['DE',num2str(Confi),'Fobj',num2str(CasoF)]

        %Recoleccion de datos
        for ni = 1:50
        disp(['Ejecución: ',num2str(ni)]);

        %Run DE
        tic
        [x,fmin,Iter] = DEalg(FunObj,bounds,parametros) ;       
        tn = toc;

        %Datos y almacenamiento de variables
        DatK(ni) = Iter;
        DatF(ni) = fmin;
        DatP(ni,:) = x;
        DatT(ni) = tn;
        
        %Guardar las variables
        save(fname,'DatK','DatF','DatP','DatT');
        end
    end
end

