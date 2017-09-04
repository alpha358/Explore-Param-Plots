%================================= Paths ==================================
addpath(genpath('C:\Users\Alfonsas\Desktop\MATLAB\Geom-Plate-Diffraction'))




%% ============================ Initial stuff =============================
plot_name = 'BlazeGF_FocusFrenel';

% Limit threads for stability
% maxNumCompThreads(8);
% parpool('SpmdEnabled', false)

%%======= Cell arrays determine for all possible parameter values. ========


% -------------------------- Variable Parameters --------------------------

paramValues =  containers.Map();

% TODO: make allcomb work at 5
% Rounding to 5 decimal places due to rounding in allcomb
paramValues('retardance') = num2cell( round(linspace(0, 2 ,11), 5, 'significant') );  % focusing angle   % 1
paramValues('E_in') = {'x', 'y', 'x+iy', 'x-iy'};
paramValues('b') = num2cell( round(20:10:120, 5, 'significant') );
% handle to get cell id for parameters
cellID = @(keys) find(  contains(paramValues.keys, keys)  );

%% ======================== handle to the plot fn =========================
% todo: auto detect scale
plot_api_handle = @(varargin) focus_blaze_grating(         ...
                varargin{  cellID('retardance')  },              ...   % n1: refractive index 1
                varargin{  cellID('b')  }, ...    
                varargin{  cellID('E_in')  } ...
              );




% plot_api_handle = @(varargin) plot_api(varargin{:});

%% ================================= RUN ==================================
main_fn( plot_name, paramValues, plot_api_handle);
