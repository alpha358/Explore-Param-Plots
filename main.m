%****************************** Description *******************************
% ALL PARAMETERS MUST BE NUMERIC !
% May be updated to strings in the future.
% *************************************************************************

%% ======================== Loading required code ========================


%% ========================= Defining Parameters ==========================
paramNames = ['a', 'b', 'c'];


%                        1 - Slider,    2 - Select
paramTypes = [1, 1, 1];


% -------------------- Initializing dictionary/hashmap --------------------
paramValues =  containers.Map();

%-------------------- Defining parameter value arrays --------------------
% Parameters are only numeric!

paramValues('a') = 1:3;
paramValues('b') = 1:3;
paramValues('c') = 1:3;

% ---------- Constructing cartesian product of parameter values -----------
paramValsCells = paramValues.values;
paramValuesMat = cartprod(paramValsCells{:});
clear paramValsCells;
%  some arcane magic of matlab

% t = num2cell([1,2,3,4]);
% [a,b,c,d] = deal(t{:});

%% ============================ Generate plots ============================
for n = 1:length(paramValuesMat) % go trough all the param values
% for n = 1:1 % go trough all the param values

    % ------------------- Multiple parameter asignment --------------------
    p = num2cell(paramValuesMat(n,:));

    % Pass an array as a variable list
    h = plot_api(p{:});

    % --------------------------- Save the plot ---------------------------
    save_param_plot(h, name, paramNames, p)
    % TODO: sutvarkyti sasaja tarp paramNames <-> p
end
