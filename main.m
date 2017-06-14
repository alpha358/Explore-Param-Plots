%****************************** Description *******************************
% ALL PARAMETERS MUST BE NUMERIC !
% May be updated to strings in the future.
% *************************************************************************

%% ======================== Loading required code ========================

plot_name = 'testas';

%% ========================= Defining Parameters ==========================
paramNames = ['a', 'b', 'c'];


%                         1 - Slider,    2 - Select
paramTypes = [1, 1, 1];


% -------------------- Initializing dictionary/hashmap --------------------
paramValues =  containers.Map();

%-------------------- Defining parameter value arrays --------------------
% Parameters are only numeric!

paramValues('a') = 1:3;
paramValues('b') = 1:3;
paramValues('c') = 1:3;

% ---------- Constructing cartesian product of parameter values -----------
temp_paramValsCells = paramValues.values;
    paramNamesCells = paramValues.keys;
% Cartesian product of sets
paramValuesCartProd = cartprod(temp_paramValsCells{:});
clear temp_paramValsCells;

%% ============================ Generate plots ============================
% for n = 1:length(paramValuesCartProd) % go trough all the param values
for n = 1:1 % go trough all the param values

    % ------------------- Multiple parameter asignment --------------------
    p = num2cell(paramValuesCartProd(n,:));

    % Pass an array as an argument list
    fig = plot_api(p{:});

    % --------------------------- Save the plot ---------------------------
    img_name = generate_img_name( plot_name,  paramNamesCells, p);
%     TODO: Ar nesumaiso vardu ir reiksmiu ?
%     Probably not. Probably returns keys and vals in the same order.
    save_param_plot(fig, name, img_name);
    close all;
end
