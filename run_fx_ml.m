%================================= Paths ==================================
addpath(genpath('C:\Users\Alfonsas\Desktop\FX_ML'))




%% ============================ Initial stuff =============================
plot_name = 'ann_fx_1';

% Limit threads for stability
% maxNumCompThreads(8);
% parpool('SpmdEnabled', false)

%%======= Cell arrays determine for all possible parameter values. ========


% -------------------------- Variable Parameters --------------------------

paramValues =  containers.Map();

% Rounding to 5 decimal places due to rounding in allcomb
paramValues('inputDelays') = num2cell( [2 3 4 5 6] );
paramValues('ma_lag') = num2cell( [5 10 15 16 17 18 20] );
paramValues('N_train') = num2cell( [50 100 200 500 800] );
paramValues('N_predict') = num2cell( [2 3 4 10] );
paramValues('size_factor') = num2cell( [1/2 1 2] );
% handle to get cell id for parameters
cellID = @(keys) find(  contains(paramValues.keys, keys)  );

%% ======================== handle to the plot fn =========================
% todo: auto detect scale
plot_api_handle = @(varargin) fn_moving_prediction(         ...
                varargin{ cellID('inputDelays')  },              ...   % n1: refractive index 1
                varargin{ cellID('ma_lag')  }, ...
                varargin{ cellID('N_train')  }, ...
                varargin{ cellID('N_predict')  }, ...
                varargin{ cellID('size_factor')  } ...
              );




% plot_api_handle = @(varargin) plot_api(varargin{:});

%% ================================= RUN ==================================
main_fn( plot_name, paramValues, plot_api_handle);
