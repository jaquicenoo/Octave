function params = OptionsGA(varargin)
%Parametros del algoritmo GA
% tolerance: the tolerance during calculation, e.g. 1e-4
% popSize: the size of population, must be a positive even integer, e.g. 30 (numero par)
% generationsNum: the number of generations, the terminal criteria, e.g. 1000
% crossProb: the probability of crossing over, e.g. 0.9
% mutateProb: the probability of mutation, e.g. 0.1
% ShowFlag: Bandera para mostrar iteraciones (Si: 1, No: 0) (0)

%Se pueden adicionar más parámetros!!!
%Parámetros por defecto
tolerance = 1e-4;
popSize = 30;
generationsNum = 1000;
crossProb = 0.9;
mutateProb = 0.1;
ShowIter = 0;

%Adición de todos las parámetros en la estructura
params = struct('tolerance',tolerance,'popSize',popSize,'generationsNum',generationsNum,'crossProb',crossProb,'mutateProb',mutateProb,'ShowIter',ShowIter);

%Set de los nuevos parámetros
if ~isempty(varargin)
for i = 1:2:nargin
    params=setfield(params,varargin{i},varargin{i+1});
end
end

