%Funciones de prueba ND
%Funcion de prueba: 1 - 8

%Funciones de prueba
    switch CasoF
        case 1
            FunObj=@Spherical;
            RangeO = 200;
        case 2
            FunObj=@levy;
            RangeO = 20;
        case 3
            FunObj=@stybtang;
            RangeO = 10.24;
        case 4
            FunObj=@Rosenbrock;
            RangeO = 60;
        case 5
            FunObj=@Griewank;
            RangeO = 100;
        case 6
            FunObj=@Rastrigin;
            RangeO = 10.24;
        case 7
            FunObj=@SchafferF7;
            RangeO = 60;
        case 8    
            FunObj=@Ackley;
            RangeO = 60;
        otherwise
            FunObj=@Spherical;
            RangeO = 200;    
    end
