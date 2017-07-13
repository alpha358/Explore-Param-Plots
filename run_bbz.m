%================================= Paths ==================================
addpath(genpath('C:\Users\AJursenas\Desktop\Fresnel_Diffraction'))


%% ============================ Initial stuff =============================
plot_name = 'BBZ2';

% Limit threads for stability
% maxNumCompThreads(8);

%%======= Cell arrays determine for all possible parameter values. ========

% --------------------------- Static Parameters ---------------------------

% Fixed parameters


% -------------------------- Variable Parameters --------------------------

paramValues =  containers.Map();

% TODO: make allcomb work at 5
% Rounding to 5 decimal places due to rounding in allcomb
paramValues('alpha1') = num2cell( round( linspace(0.1, 1, 20), 5, 'significant') );
paramValues('n') = num2cell( round( linspace(50, 250, 20),  4 )  );
paramValues('K') = num2cell( [1.6 1.7, 1.8] );

% handle to get cell id for parameters
cellID = @(keys) find(  ismember(paramValues.keys, keys)  );

% diffract_bbz( n, alpha1, K )
%% ======================== handle to the plot fn =========================
% diffract_bbz( n, alpha1, K )

plot_api_handle = @(varargin) diffract_bbz(             ...
                varargin{  cellID('n')  },              ...   % 
                varargin{  cellID('alpha1')  },         ...   % 
                varargin{  cellID('K')  }               ...   % alpha2/alpha1
              );

% plot_api_handle = @(varargin) plot_api(varargin{:});

%% ================================= RUN ==================================
main_fn( plot_name, paramValues, plot_api_handle);
