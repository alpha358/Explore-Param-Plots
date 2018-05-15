%================================= Paths ==================================
addpath(genpath('C:\Users\Alfonsas\Desktop\MATLAB\Focus_Into_Medium'))


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
paramValues('th_max') = num2cell( round([5 10 30 40 50 60 70], 5, 'significant') );  % focusing angle   % 1
paramValues('n1') = num2cell([1.0 1.5 2.0 2.5]);                                  % 2
paramValues('n2') = num2cell([1.0 1.5 2.0 2.5]);                                  % 3
% paramValues('spectrum') = {'Nx', 'Ny', 'Nz', 'Mx', 'My', 'Mz'};                 % 4
% paramValues('compensation') = {'comp', 'no_comp'};                              % 5
paramValues('plot_case') = {'x', 'z'};                             % 6
paramValues('L') = num2cell([5000 5500]);                             % 6
% paramValues('plot_case') = {'zx'};                             % 6

% handle to get cell id for parameters
cellID = @(keys) find(  contains(paramValues.keys, keys)  );

%% ======================== handle to the plot fn =========================
% todo: auto detect scale
plot_api_handle = @(varargin) plot_api1(   ...
              0,   ... % z0
              varargin{ cellID('n1')} ,   ... % n1
              varargin{ cellID('n2')} ,   ... % n2
              varargin{ cellID('L')} ,   ... % L
              varargin{ cellID('th_max')} ,   ... % th_max
              varargin{ cellID('plot_case')}   ... % plot_case
    );




% plot_api_handle = @(varargin) plot_api(varargin{:});

%% ================================= RUN ==================================
main_fn( plot_name, paramValues, plot_api_handle);
