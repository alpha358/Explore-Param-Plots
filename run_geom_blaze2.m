%================================= Paths ==================================
addpath(genpath('C:\Users\Alfonsas\Desktop\MATLAB\Geom-Plate-Diffraction'))




%% ============================ Initial stuff =============================
plot_name = 'BlazeGF_Thin_Lens_Focus6';

% Limit threads for stability
% maxNumCompThreads(8);
parpool('SpmdEnabled', false)

%%======= Cell arrays determine for all possible parameter values. ========


% -------------------------- Variable Parameters --------------------------

paramValues =  containers.Map();

% TODO: make allcomb work at 5
% Rounding to 5 decimal places due to rounding in allcomb
paramValues('retardance') = num2cell( round(0.6:0.02:1.2, 5, 'significant') );  % focusing angle   % 1
paramValues('E_in') = {'x'};
paramValues('plot_type') = {'FresnelZone', 'E_in_Polarization'};
paramValues('b') = num2cell( round([20 30], 5, 'significant') );
paramValues('waveplate_angle') = num2cell( round([-180:5:180], 5, 'significant') );
% paramValues('GF_angle') = num2cell( round([-180:10:180], 5, 'significant') );
% handle to get cell id for parameters
cellID = @(keys) find(  contains(paramValues.keys, keys)  );

%% ======================== handle to the plot fn =========================
% todo: auto detect scale
plot_api_handle = @(varargin) focus_blaze_grating2(         ...
                varargin{  cellID('plot_type')  },              ...   % n1: refractive index 1
                varargin{  cellID('retardance')  },              ...   % n1: refractive index 1
                varargin{  cellID('b')  }, ...
                varargin{  cellID('E_in')  }, ...
                varargin{  cellID('waveplate_angle')  }, ...
                0 ...
              );




% plot_api_handle = @(varargin) plot_api(varargin{:});

%% ================================= RUN ==================================
main_fn( plot_name, paramValues, plot_api_handle);
