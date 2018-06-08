function params = OptionsPSO(varargin)
%Par�metros del algoritmo PSO
%num: N�mero de part�culas (25)
%chi: Factor de restricci�n (1)
%w: Inercia (0.6)
%c1: Ponderaci�n componente cognitiva (1.7)
%c2: Ponderaci�n componente social (1.7)
%MaxIter: m�ximo n�mero de iteraciones (1000)
%StartPop: poblaci�n inicial ([])
%ShowFlag: Bandera para mostrar iteraciones (Si: 1, No: 0) (0)

%Se pueden adicionar m�s par�metros!!!

%Par�metros por defecto
num = 25;
chi = 1;
w = 0.600;
c1 = 1.700;
c2 = 1.700;
MaxIter = 1000;
StartPop = [];
ShowIter = 0;

%Adici�n de todos las par�metros en la estructura
params = struct('num',num,'chi',chi,'w',w,'c1',c1,'c2',c2,'MaxIter',MaxIter,'StartPop',StartPop,'ShowIter',ShowIter);

%Set de los nuevos par�metros
if ~isempty(varargin)
for i = 1:2:nargin
    params=setfield(params,varargin{i},varargin{i+1});
end
end

