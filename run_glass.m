%==================================== Paths ====================================
addpath(genpath('C:\Users\Alfonsas\Desktop\MATLAB\Explore_Focusing_Into_Medium'))


%% =============================== Initial stuff ===============================
plot_name = 'test3';

%%========== Cell arrays determine for all possible parameter values. ==========

% ----------------------------- Static Parameters ------------------------------

% Fixed parameters
z0 = 0;
Ntheta = 100;
scale = 1;
Lfocal = 300  * scale; % longitudinal observation scale
L      = 300  * scale;
L1 = L/4;  L2 = 3*L/8;   L3 = 5*L/8;   L4 = 3*L/4;
z_observe = L2; %
m=0;
th_min = 0.1 /180*pi;
Tfocal = 5/sin(10* pi /180);

% ---------------------------- Variable Parameters -----------------------------

paramValues =  containers.Map();

% TODO: make allcomb work at 5
% Rounding to 5 decimal places due to rounding in allcomb
paramValues('th_max') = num2cell( round([30 40 50 60 70].*pi./180, 5, 'significant') );  % focusing angle   % 1
paramValues('n1') = num2cell([1.0  1.5  2.5]);                                  % 2
paramValues('n2') = num2cell([1.0  1.5  2.5]);                                  % 3
paramValues('spectrum') = {'Nx', 'Ny', 'Nz', 'Mx', 'My', 'Mz'};                 % 4
paramValues('compensation') = {'comp', 'no_comp'};                              % 5
% paramValues('plot_case') = {'zx', 'z', 'xy', 'zy'};                             % 6
paramValues('plot_case') = {'zx'};                             % 6

% handle to get cell id for parameters
cellID = @(keys) find(  contains(paramValues.keys, keys)  );

%% =========================== handle to the plot fn ===========================
% todo: auto detect scale
plot_api_handle = @(varargin) focus_into_medium( ...
                varargin{  cellID('n1')  },              ...   % n1: refractive index 1
                varargin{  cellID('n2')  },              ...   % n2: refractive index 2
                z0,                                      ...   % z0: interface position on z-axis
                varargin{  cellID('spectrum')  },        ...   % spectrum: angular vector spectrum of the beam
                m,                                       ...   % m: topolog charge
                z_observe,                               ...   % z_observe: z-position of xy plot, in lambdas
                varargin{  cellID('th_max')  },          ...   % th_max: maximal focal angle, rad
                th_min,                                  ...   % th_min: minimum focal angle, rad
                varargin{  cellID('compensation')  },    ...   % compensation:"phi", "theta", "none"
                varargin{  cellID('plot_case')  },       ...   % plot_case: "xy", "zx", "zy"
                varargin{  cellID('spectrum')  },        ...   % spectrum: name of the plot
                L,                                       ...   % L: Fourier period
                Ntheta,                                  ...   % Ntheta: Theta discretization
                Lfocal,                                  ...   % Lfocal: longitudinal observation scale
                Tfocal                                   ...   % Tfocal: transverse observation scale
              );




% plot_api_handle = @(varargin) plot_api(varargin{:});

%% ==================================== RUN ====================================
main_fn( plot_name, paramValues, plot_api_handle);
