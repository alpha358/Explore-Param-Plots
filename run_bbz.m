%================================= Paths ==================================
addpath(genpath('C:\Users\AJursenas\Desktop\Fresnel_Diffraction'))

warning('off','all');
%% ============================ Initial stuff =============================
plot_name = 'BBZ_Burch';

% Limit threads for stability
% maxNumCompThreads(8);

%%======= Cell arrays determine for all possible parameter values. ========

% --------------------------- Static Parameters ---------------------------

% Fixed parameters


% -------------------------- Variable Parameters --------------------------

paramValues =  containers.Map();

% TODO: make allcomb work at 5
% Rounding to 5 decimal places due to rounding in allcomb
paramValues('mask_type') = {'Burch', 'Phase'};
paramValues('plt_type') = {'z', 'x'};
paramValues('alpha1') = num2cell( round( linspace(0.1, 0.6, 15), 5, 'significant') );
paramValues('K') = num2cell( round( [1.7], 5, 'significant') );
paramValues('z0') = num2cell( round( linspace(0.01, 0.08, 10), 5, 'significant') );
paramValues('n') = num2cell(round( linspace(10, 200, 20), 5, 'significant') );

% handle to get cell id for parameters
cellID = @(keys) find(  ismember(paramValues.keys, keys)  );

% diffract_bbz(plt_type, n, alpha1, K, z0)
%% ======================== handle to the plot fn =========================
% diffract_bbz( n, alpha1, K )

plot_api_handle = @(varargin) diffract_bbz(             ...
                varargin{  cellID('mask_type')  },      ...
                varargin{  cellID('plt_type')  },       ...
                varargin{  cellID('n')  },              ...
                varargin{  cellID('alpha1')  },         ...
                varargin{  cellID('K')  },              ...
                varargin{  cellID('z0')  }              ...
              );

% plot_api_handle = @(varargin) plot_api(varargin{:});

%% ================================= RUN ==================================
main_fn( plot_name, paramValues, plot_api_handle);
