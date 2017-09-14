%% Paths


%% Initial stuff
plot_name = 'test3';

% Cell arrays determine for all possible parameter values.
paramValues =  containers.Map();
paramValues('a') = num2cell(1:3);
paramValues('b') = num2cell(1:3);
paramValues('c') = {'Ex', 'Ey', 'Ez'};

% handle to the plot fn
plot_api_handle = @(varargin) plot_api(varargin{:});

%% RUN
main_fn( plot_name, paramValues, plot_api_handle);