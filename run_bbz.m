%================================= Paths ==================================
addpath(genpath('C:\Users\Alfonsas\Desktop\MATLAB\Fresnel_Diffraction'))


%% ============================ Initial stuff =============================
plot_name = 'BBZ';

% Limit threads for stability
% maxNumCompThreads(8);

%%======= Cell arrays determine for all possible parameter values. ========

% --------------------------- Static Parameters ---------------------------

% Fixed parameters


% -------------------------- Variable Parameters --------------------------

paramValues =  containers.Map();

% TODO: make allcomb work at 5
% Rounding to 5 decimal places due to rounding in allcomb
paramValues('alpha1') = num2cell( round( linspace(0.1, 1, 20).*pi./180, 5, 'significant') );
paramValues('n') = num2cell( linspace(10, 200, 20) );

% handle to get cell id for parameters
cellID = @(keys) find(  contains(paramValues.keys, keys)  );

%% ======================== handle to the plot fn =========================
plot_api_handle = @(varargin) diffract_bbz(             ...
                varargin{  cellID('alpha1')  },         ...   % n1: refractive index 1
                varargin{  cellID('n')  }              ...   % n2: refractive index 2
              );

% plot_api_handle = @(varargin) plot_api(varargin{:});

%% ================================= RUN ==================================
main_fn( plot_name, paramValues, plot_api_handle);
