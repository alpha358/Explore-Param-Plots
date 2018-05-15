%================================= Paths ==================================
addpath(genpath('C:\Users\Alfonsas\Desktop\MATLAB\Focus_Into_Medium'))


%% ============================ Initial stuff =============================
plot_name = 'glass_angle2';

% Limit threads for stability
% maxNumCompThreads(8);

%%======= Cell arrays determine for all possible parameter values. ========

% --------------------------- Static Parameters ---------------------------


% Fixed parameters

lambda = 532*10^-9;
L = 300 * lambda;
z0 = 0;


% -------------------------- Variable Parameters --------------------------

paramValues =  containers.Map();

% TODO: make allcomb work at 5
% Rounding to 5 decimal places due to rounding in allcomb
paramValues('th_max') = num2cell( round([5 10 30 40 50 60 70], 5, 'significant') );  % focusing angle   % 1
paramValues('n1') = num2cell([1.0 1.5 2.0 2.5 3.0 3.5 4.0]);                                  % 2
paramValues('n2') = num2cell([1.0 1.5 2.0 2.5 3.0 3.5 4.0]);                                  % 3
% paramValues('spectrum') = {'Nx', 'Ny', 'Nz', 'Mx', 'My', 'Mz'};                 % 4
paramValues('spectrum') = {'Nx'};                 % 4
paramValues('compensation') = {'true', 'false'};                              % 5
% paramValues('plot_case') = {'zx', 'xy', 'zy'};                             % 6
paramValues('plot_case') = {'zx'};                             % 6
paramValues('alpha') = num2cell( round([0 1 3 10 15 30 40], 5, 'significant') );  % focusing angle   % 1

% handle to get cell id for parameters
cellID = @(keys) find(  contains(paramValues.keys, keys)  );
% ismember is alternative to contains

%% ======================== handle to the plot fn =========================
% todo: auto detect scale
plot_api_handle = @(varargin) plot_api2(...
                              z0, ...
                              varargin{  cellID('n1')  },      ...   % n1: refractive index 1
                              varargin{  cellID('n2')  },      ...   % n2: refractive index 2
                              L,                               ...   % L: Fourier period
                              varargin{  cellID('th_max')  },  ...   % th_max: maximal focal angle, rad
                              varargin{  cellID('alpha')  },  ...   % th_max: maximal focal angle, rad
                              varargin{  cellID('plot_case')  },       ...   % plot_case: "xy", "zx", "zy"
                              varargin{  cellID('spectrum')  },        ...   % spectrum: name of the plot
                              varargin{  cellID('compensation')  }        ...   % compensation case
                              );
%
%
% plot_api_handle = @(varargin) focus_into_medium(         ...
%                 varargin{  cellID('n1')  },              ...   % n1: refractive index 1
%                 varargin{  cellID('n2')  },              ...   % n2: refractive index 2
%                 z0,                                      ...   % z0: interface position on z-axis
%                 varargin{  cellID('spectrum')  },        ...   % spectrum: angular vector spectrum of the beam
%                 m,                                       ...   % m: topolog charge
%                 z_observe,                               ...   % z_observe: z-position of xy plot, in lambdas
%                 varargin{  cellID('th_max')  },          ...   % th_max: maximal focal angle, rad
%                 th_min,                                  ...   % th_min: minimum focal angle, rad
%                 varargin{  cellID('compensation')  },    ...   % compensation:"phi", "theta", "none"
%                 varargin{  cellID('plot_case')  },       ...   % plot_case: "xy", "zx", "zy"
%                 varargin{  cellID('spectrum')  },        ...   % spectrum: name of the plot
%                 L,                                       ...   % L: Fourier period
%                 Ntheta,                                  ...   % Ntheta: Theta discretization
%                 Lfocal,                                  ...   % Lfocal: longitudinal observation scale
%                 Tfocal                                   ...   % Tfocal: transverse observation scale
%               );




% plot_api_handle = @(varargin) plot_api(varargin{:});

%% ================================= RUN ==================================
main_fn( plot_name, paramValues, plot_api_handle);
