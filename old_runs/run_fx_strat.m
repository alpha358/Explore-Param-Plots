%================================= Paths ==================================
addpath(genpath('C:\Users\Alfonsas\Desktop\FX_ML'))




%% ============================ Initial stuff =============================
plot_name = 'fx_ml_var_expiration2';

% Limit threads for stability
% maxNumCompThreads(8);
% parpool('SpmdEnabled', false)

%%======= Cell arrays determine for all possible parameter values. ========


% -------------------------- Variable Parameters --------------------------

paramValues =  containers.Map();

% Rounding to 5 decimal places due to rounding in allcomb
paramValues('lag') = num2cell( [2 3 4 5 6].*10 );
paramValues('N_train')     = num2cell( [10 20 50 60].*10 );
paramValues('trade_scale')   = num2cell( [9 10 14 15] );
paramValues('input_delays')   = num2cell( [2 3 4] );
paramValues('expiration')   = num2cell( [2 3 4 5 6].*10 );

% handle to get cell id for parameters
cellID = @(keys) find(  contains(paramValues.keys, keys)  );

%% ======================== handle to the plot fn =========================
% todo: auto detect scale
% ( trade_scale, lag, N_train, input_delays )
% trade_scale, lag, N_train, input_delays
plot_api_handle = @(varargin) strategy_test(     ...
                varargin{ cellID('trade_scale')  },         ...
                varargin{ cellID('lag') },   ...
                varargin{ cellID('N_train') },       ...
                varargin{ cellID('input_delays') },       ...
                varargin{ cellID('expiration') }       ...
              );



% plot_api_handle = @(varargin) plot_api(varargin{:});

%% ================================= RUN ==================================
main_fn( plot_name, paramValues, plot_api_handle);
