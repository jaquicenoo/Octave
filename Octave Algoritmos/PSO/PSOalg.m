function [x,f,gen,xnow,value]=PSOalg(evalFN,bounds,params);
%PSO ejecuta el algoritmo
%evalFN: Funci�n objetivo 
%bounds: Limites de b�squeda [Linf(D,1) Lsup(D,1)]
%params: Par�metros
%Par�metros del algoritmo PSO
%num: N�mero de part�culas (25)
%chi: Factor de restricci�n (1)
%w: Inercia (0.6)
%c1: Ponderaci�n componente cognitiva (1.7)
%c2: Ponderaci�n componente social (1.7)
%MaxIter: m�ximo n�mero de iteraciones (1000)
%startPop: poblaci�n inicial ([])

%Se cargan todos los par�metros del algoritmo
if nargin < 3
    params = OptionsPSO( );
else
    if isempty(params)
        params = OptionsPSO( );
    end
end

num = params.num;
chi = params.chi;
w = params.w;
c1 = params.c1;
c2 = params.c2;
MaxIter = params.MaxIter;
StartPop = params.StartPop;
ShowIter = params.ShowIter;

%%%%%INICIALIZACION%%%%%
%rand('seed',512341234)
D=size(bounds,1);
diffe=bounds(:,2)-bounds(:,1);

%Posici�n
if isempty(StartPop)
    %Posiciones aleatorias puras
    for m=1:D
        xnow(:,m)=bounds(m,1)+rand(num,1)*diffe(m);
    end
else
    %Posiciones dadas por usuario
    xnow = StartPop;
end

%Velocidad
for m=1:D
    %vnow(:,m)=(rand(num,1)-0.5)*2*diffe(m-D);
    vnow(:,m)=zeros(num,1);
end

%Valor de la funci�n objetivo
for m=1:num
    val = evalFN(xnow(m,1:D));
    value(m,1)=val;
end

%Actual Pbest
pb = xnow;
pbval = value;

%Actual Gbest
[minval,n] = min(value);
gb = xnow(n,1:D);
gbval = value(n,1);

%%%%%PSOPSOPSOPSOPSO%%%%%

%Variables algoritmo PSO
xnew = xnow;
bestg = 0;

%Par�metros para los criterios de parada
%ergrd = 1e-7;
%ergrdep = 150;
%Lambda_min = 0.0001;

%Para finalizar por iteraciones
ergrd = -Inf;
ergrdep = Inf;
Lambda_min = 0;

%Variables para el criterio de parada
tmp1 = 0;
cnt2 = 0;

%Ciclo principal
for gen = 1:MaxIter
    %Calcular el fitness para la posici�n actual xnow
    xnow=xnew;
    for m=1:num
    val = evalFN(xnow(m,1:D));
    value(m,1)=val;
    end
    
    %Condici�n para remplazar pbest
    for m=1:num
        if value(m,1) < pbval(m,1)
            pb(m,1:D)=xnow(m,1:D);
            pbval(m,1)=value(m,1);
        end
    end
    
    %Condici�n para remplazar gbest
    [minval,n]=min(value);
    if  minval < gbval(1)
        tmp1 = abs(gbval-minval);
        gb=xnow(n,:);
        gbval=minval;
        bestg=gen;
    end
    
    %Calcular los nuevos valores de vnew, xnew
    vnow = chi*(w*vnow+c1*rand(m,D).*(pb(:,1:D)-xnow)+c2*rand(m,D).*(repmat(gb,num,1)-xnow));  
    xnew = xnow+vnow;
    
    %%%%%CRITERIOS DE PARADA%%%%%
    %Criterio de parada mirando la velocidad de las part�culas
    RangeO = abs(max(diffe));
    velmin = Lambda_min*RangeO;

    velm = max(sqrt(sum(vnow.^2,2)));
    if velm <= velmin
        if ShowIter == 1
            disp([' ']);
            disp(['Velocidad m�nima alcanzada: ',num2str(velm)]);
        end
        break;
    end 

    %Criterio de finalizaci�n mirando el cambio de la funci�n objetivo 
    if tmp1 > ergrd
       cnt2 = 0;
    elseif tmp1 <= ergrd
       cnt2 = cnt2+1;
       if cnt2 >= ergrdep
         if ShowIter == 1
             disp([' ']);
          disp(['Cambio de GBest menor de: ',num2str(ergrd),' durante: ', num2str(cnt2),' iteraciones']);
         end       
         break;
       end
    end
    
    %Pasar a la siguiente generaci�n
    %w=w-0.01;    % w declines linearly
    if ShowIter == 1
        disp(['Iteraci�n: ',num2str(gen),'  Valor: ',num2str(minval)]);
    end
end

%Presentaci�n del resultado
if ShowIter == 1
    disp([' ']);
    disp(['Mejor generaci�n: ',num2str(bestg),'  Valor: ',num2str(minval)]);
end

%Datos de salida
x = gb;
f = gbval;
return
