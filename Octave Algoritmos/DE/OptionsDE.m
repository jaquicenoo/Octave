function params = OptionsDE(varargin)
%********************************************************************
% Script file for the initialization and run of the differential 
% evolution optimizer.
%********************************************************************
%
% F_VTR: "Value To Reach" (stop when ofunc < F_VTR) (0.001)
% I_bnd_constr: 1: use bounds as bound constraints, 0: no bound constraints (0)
% I_NP: number of population members (20)
% I_itermax: maximum number of iterations (generations) (500)
% F_weight: DE-stepsize F_weight ex [0, 2] (0.85)
% F_CR: crossover probabililty constant ex [0, 1] (1)
% I_strategy (1)    
%                1 --> DE/rand/1:
%                      the classical version of DE.
%                2 --> DE/local-to-best/1:
%                      a version which has been used by quite a number
%                      of scientists. Attempts a balance between robustness
%                      and fast convergence.
%                3 --> DE/best/1 with jitter:
%                      taylored for small population sizes and fast convergence.
%                      Dimensionality should not be too high.
%                4 --> DE/rand/1 with per-vector-dither:
%                      Classical DE with dither to become even more robust.
%                5 --> DE/rand/1 with per-generation-dither:
%                      Classical DE with dither to become even more robust.
%                      Choosing F_weight = 0.3 is a good start here.
%                6 --> DE/rand/1 either-or-algorithm:
%                      Alternates between differential mutation and three-point-
%                      recombination.           
% I_refresh (10)intermediate output will be produced after "I_refresh"
%               iterations. No intermediate output will be produced
%               if I_refresh is < 1
% I_plotting    Will use plotting if set to 1. Will skip plotting otherwise (0)

%Valores por defecto
F_VTR = 0.001;
I_bnd_constr = 0;
I_NP = 20; 
I_itermax = 500; 
F_weight = 0.85; 
F_CR = 1; 
I_strategy = 1;
I_refresh = 10;
I_plotting = 0;
ShowIter = 0;

%***************************************************************************
% Problem dependent but constant values. For speed reasons these values are 
% defined here. Otherwise we have to redefine them again and again in the
% cost function or pass a large amount of parameters values.
%***************************************************************************

%-----bound at x-value +/- 1.2--------------------------------------------
%params.FVr_bound  =[];

%-----Definition of tolerance scheme--------------------------------------
%-----The scheme is sampled at I_lentol points----------------------------
I_lentol   = 50;
FVr_x      = linspace(-1,1,I_lentol); %ordinate running from -1 to +1
FVr_lim_up = ones(1,I_lentol);   %upper limit is 1
FVr_lim_lo = -ones(1,I_lentol);  %lower limit is -1

%Adicion de todos las parametros en la estructura
params.I_lentol   = I_lentol;
params.FVr_x      = FVr_x;
params.FVr_lim_up = FVr_lim_up;
params.FVr_lim_lo = FVr_lim_lo;

params.I_NP         = I_NP;
params.F_weight     = F_weight;
params.F_CR         = F_CR;
% params.I_D          = I_D;
% params.FVr_minbound = FVr_minbound;
% params.FVr_maxbound = FVr_maxbound;
params.I_bnd_constr = I_bnd_constr;
params.I_itermax    = I_itermax;
params.F_VTR        = F_VTR;
params.I_strategy   = I_strategy;
params.I_refresh    = I_refresh;
params.I_plotting   = I_plotting;

params.ShowIter = ShowIter;


%Set de los nuevos parametros
if ~isempty(varargin)
for i = 1:2:nargin
    params=setfield(params,varargin{i},varargin{i+1});
end
end
