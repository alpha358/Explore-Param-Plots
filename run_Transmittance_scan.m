%================================= Paths ==================================
%addpath(genpath('C:\Users\Alfonsas\Desktop\Scattering\TMM'))

  %addpath(genpath('C:\Users\Alfonsas\Desktop\Scattering\TMM\computation'));
  %addpath(genpath('C:\Users\Alfonsas\Desktop\Scattering\TMM\precomputed_data'));
  %addpath(genpath('C:\Users\Alfonsas\Desktop\Scattering\TMM\plots'));
  addpath(genpath('C:\Users\Alfonsas\Desktop\Scattering\TMM'));
  



%% ============================ Initial stuff =============================
plot_name = 'Transmittance_scan3';

% Limit threads for stability
% maxNumCompThreads(8);
% parpool('SpmdEnabled', false)

%%======= Cell arrays determine for all possible parameter values. ========


% -------------------------- Variable Parameters --------------------------

paramValues =  containers.Map();

% Rounding to 5 decimal places due to rounding in allcomb
paramValues('alpha')      = num2cell( [60 : 10 : 300] );
paramValues('plot_type')  = {'Transmittance', 'Chirality', 'Cluster'};
paramValues('top_charge') = num2cell( [0 : 1 : 2] );
% Si, Ag, Au, 500nm
paramValues('epsilon')    = num2cell( [4.3 + 0.07i, 0.05 + 3.13i, 0.97 + 1.87i] );

% handle to get cell id for parameters
cellID = @(keys) find(  contains(paramValues.keys, keys)  );

%% ======================== handle to the plot fn =========================
% todo: auto detect scale
% ( trade_scale, lag, N_train, input_delays )
% trade_scale, lag, N_train, input_delays
plot_api_handle = @(varargin) fn_transmitted_power(     ...
                varargin{ cellID('alpha')  },         ...
                varargin{ cellID('plot_type') },   ...
                varargin{ cellID('top_charge') },       ...
                varargin{ cellID('epsilon') }       ...
              );

%fn_transmitted_power( alpha, plot_type, top_charge, epsilon )
% plot_api_handle = @(varargin) plot_api(varargin{:});



%% ================================= RUN ==================================
main_fn( plot_name, paramValues, plot_api_handle);
