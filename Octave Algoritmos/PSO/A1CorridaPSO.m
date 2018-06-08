clc
clear all
close all

%%%%%Ejecución del algoritmo PSO%%%%%

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

        %%Tipo de PSO:
        switch Confi
            case 1
            %Caso 1: Trelea model 1
            chi = 1;
            w = 0.600;
            c1 = 1.700;
            c2 = 1.700;
            case 2
            %Caso 2: Trelea model 2
            chi = 1;
            w = 0.729;
            c1 = 1.494;
            c2 = 1.494;
            otherwise
            %Caso 3: Clerc Type 1 - with constriction
            chi = 0.72984;
            w = 1;
            c1 = 2.05;
            c2 = 2.05;
        end

        %Configuracion y parametros del algoritmo     
        parametros = OptionsPSO('num',30,'chi',chi,'w',w,'c1',c1,'c2',c2,'MaxIter',2000,'ShowIter',0);
                
        %Nombre para guardar la variable
        fname = ['PSO',num2str(Confi),'Fobj',num2str(CasoF)]

        %Recoleccion de datos
        for ni = 1:50
        disp(['Ejecución: ',num2str(ni)]);

        %Run PSO
        tic
        [x,fmin,gen]=PSOalg(FunObj,bounds,parametros);
        tn = toc;

        %Datos y almacenamiento de variables
        DatK(ni) = gen;
        DatF(ni) = fmin;
        DatP(ni,:) = x;
        DatT(ni) = tn;
        
        %Guardar las variables
        save(fname,'DatK','DatF','DatP','DatT');
        end
    end
end

