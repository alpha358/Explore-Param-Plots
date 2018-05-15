%================================= Paths ==================================
addpath(genpath('C:\Users\Alfonsas\Desktop\MATLA'))


%% ============================ Initial stuff =============================
plot_name = 'glass_line_plots';

% Limit threads for stability
% maxNumCompThreads(8);

%%======= Cell arrays determine for all possible parameter values. ========

% --------------------------- Static Parameters ---------------------------


% -------------------------- Variable Parameters --------------------------

paramValues =  containers.Map();

% TODO: make allcomb work at 5
% Rounding to 5 decimal places due to rounding in allcomb
paramValues('f') = num2cell( round([5 10 30 40 50 60 70], 5, 'significant') );  % focusing angle   % 1
paramValues('D') = num2cell([1.0 1.5 2.0 2.5]);                                  % 2
paramValues('L') = num2cell([1.0 1.5 2.0 2.5]);                                  % 3

% handle to get cell id for parameters
cellID = @(keys) find(  contains(paramValues.keys, keys)  );

%% ======================== handle to the plot fn =========================
% todo: auto detect scale
plot_api_handle = @(varargin) gf_step_lens_plot(   ...
              varargin{ cellID('f')} ,   ... %  focal distance
              varargin{ cellID('L')} ,   ... %  step size
              varargin{ cellID('D')} ...  % element size
    );




% plot_api_handle = @(varargin) plot_api(varargin{:});

%% ================================= RUN ==================================
main_fn( plot_name, paramValues, plot_api_handle);
