%================================= Paths ==================================
addpath(genpath('C:\Users\Alfonsas\Desktop\FX_ML'))




%% ============================ Initial stuff =============================
plot_name = 'MA_known3';

% Limit threads for stability
% maxNumCompThreads(8);
% parpool('SpmdEnabled', false)

%%======= Cell arrays determine for all possible parameter values. ========


% -------------------------- Variable Parameters --------------------------

paramValues =  containers.Map();

% Rounding to 5 decimal places due to rounding in allcomb
paramValues('trade_scale') = num2cell( [7 8 9 10 11 12 13 15 18 19 20] );
paramValues('lag')     = num2cell( [1 2 3 4 5 6 ] );
paramValues('ma_steps_ahed')   = num2cell( [1 2 3 4 5 6] );
% handle to get cell id for parameters
cellID = @(keys) find(  contains(paramValues.keys, keys)  );

%% ======================== handle to the plot fn =========================
% todo: auto detect scale
plot_api_handle = @(varargin) strategy_test_MA(     ...    
                varargin{ cellID('trade_scale')  },         ...
                varargin{ cellID('lag') },   ...      
                varargin{ cellID('ma_steps_ahed') }       ...  
              );




% plot_api_handle = @(varargin) plot_api(varargin{:});

%% ================================= RUN ==================================
main_fn( plot_name, paramValues, plot_api_handle);
