a = [1 2 3];
b = [1 2 3];

x = cartprod(a,b);

%% ======================== Loading required code ========================


%% ========================= Defining Parameters ==========================
param_Names = ['a', 'b', 'c'];


% 1 - Slider,
% 2 - Select
param_Types = [1, 1, 1];

% paramValues(1) = [0, 10]; % a
% paramValues(2) = [0, 10]; % a
% paramValues(3) = [0, 10]; % a

% -------------------- Initializing dictionary/hashmap --------------------
paramValues =  containers.Map();

%-------------------- Defining parameter value arrays --------------------
% Parameters are only numeric.

paramValues('a') = 1:4;
paramValues('b') = 1:4;
paramValues('c') = 1:4;

% ---------- Constructing cartesian product of parameter values -----------
paramValuesMat = cartprod(                  ...
                          paramValues('a'), ...
                          paramValues('b'), ...
                          paramValues('c')  ...
                          );

% t = num2cell([1,2,3,4]);
% [a,b,c,d] = deal(t{:});

%% ============================ Generate plots ============================
for n = 1:length(paramValuesMat) % go trough all the param values

    % ------------------- Multiple parameter asignment --------------------
    p = num2cell(paramValuesMat(n,:));


    % ----------------- Pass an array as a variable list ------------------
    % x = {3, 7, 1, 8}
    % y = f(x{:})
    % is equivent to the command: y = f(3,7,1,8)

    h = plot_api(p{:});

    % --------------------------- Save the plot ---------------------------
    save_param_plot(h, name, param_Names, p)
end
