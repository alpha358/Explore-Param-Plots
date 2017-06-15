%% ======================== Loading required code ========================
addpath('jsonlab-1.5')

plot_name = 'testas';

%% ========================= Defining Parameters ==========================
% -------------------- Initializing dictionarys/hashmaps --------------------
paramValues =  containers.Map();
paramTypes =  containers.Map();

%                         1 - Slider,    2 - Select
paramTypes('a') = 'slider';
paramTypes('b') = 'slider';
paramTypes('c') = 'select';



%--------------------- Defining parameter cell arrays ---------------------
% Cell arrays determine for all possible parameter values.
paramValues('a') = num2cell(1:3);
paramValues('b') = num2cell(1:3);
paramValues('c') = {'Ex', 'Ey', 'Ez'};


% ---------- Constructing cartesian product of parameter values -----------
temp_paramValsCells = paramValues.values;
    paramNamesCells = paramValues.keys;
% Cartesian product of sets
paramValuesCartProd = allcomb(temp_paramValsCells{:});
clear temp_paramValsCells;

% ============================ Generate plots ============================
% for n = 1:length(paramValuesCartProd) % go trough all the param values
% % for n = 1:1 % go trough all the param values
% % n=1
%     % ------------------- Multiple parameter asignment --------------------
%     p = paramValuesCartProd(n,:);
% %%
%     % Pass an array as an argument list
%     fig = plot_api(p{:});
%
%     % --------------------------- Save the plot ---------------------------
%     img_name = generate_img_name( plot_name,  paramNamesCells, p);
%     save_param_plot(fig, plot_name, img_name);
%     close(fig);
% end

%% ======================= Save information for JS ========================

FileName =  [plot_name '/parameters.json'];
savejson('', map2struct(paramValues), FileName);

%  writing json as js string
S = fileread(FileName);
S = ['json_string=`', char(10), S  , '`'];
FID = fopen(FileName, 'w');
if FID == -1, error('Cannot open file %s', FileName); end
fwrite(FID, S, 'char');
fclose(FID);
