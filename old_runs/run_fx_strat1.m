%================================= Paths ==================================
addpath(genpath('C:\Users\Alfonsas\Desktop\FX_ML'))




%% ============================ Initial stuff =============================
plot_name = 'ann_strat1_v2';

% Limit threads for stability
% maxNumCompThreads(8);
% parpool('SpmdEnabled', false)

%%======= Cell arrays determine for all possible parameter values. ========


% -------------------------- Variable Parameters --------------------------

paramValues =  containers.Map();

% Rounding to 5 decimal places due to rounding in allcomb
paramValues('lag') = num2cell( [6 7 8 10 20 30] );
paramValues('N_train')     = num2cell( [50 100 200 500 800] );
paramValues('expiration')   = num2cell( [6 7 8 10 20 30] );
% handle to get cell id for parameters
cellID = @(keys) find(  contains(paramValues.keys, keys)  );

%% ======================== handle to the plot fn =========================
% todo: auto detect scale
plot_api_handle = @(varargin) run_strategy1_fn(     ...
                varargin{ cellID('lag')  },         ...
                varargin{ cellID('expiration') },   ...
                varargin{ cellID('N_train') }       ...
              );




% plot_api_handle = @(varargin) plot_api(varargin{:});

%% ================================= RUN ==================================
main_fn( plot_name, paramValues, plot_api_handle);
