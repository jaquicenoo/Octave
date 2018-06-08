function params = OptionsPSO(varargin)
%Parámetros del algoritmo PSO
%num: Número de partículas (25)
%chi: Factor de restricción (1)
%w: Inercia (0.6)
%c1: Ponderación componente cognitiva (1.7)
%c2: Ponderación componente social (1.7)
%MaxIter: máximo número de iteraciones (1000)
%StartPop: población inicial ([])
%ShowFlag: Bandera para mostrar iteraciones (Si: 1, No: 0) (0)

%Se pueden adicionar más parámetros!!!

%Parámetros por defecto
num = 25;
chi = 1;
w = 0.600;
c1 = 1.700;
c2 = 1.700;
MaxIter = 1000;
StartPop = [];
ShowIter = 0;

%Adición de todos las parámetros en la estructura
params = struct('num',num,'chi',chi,'w',w,'c1',c1,'c2',c2,'MaxIter',MaxIter,'StartPop',StartPop,'ShowIter',ShowIter);

%Set de los nuevos parámetros
if ~isempty(varargin)
for i = 1:2:nargin
    params=setfield(params,varargin{i},varargin{i+1});
end
end

