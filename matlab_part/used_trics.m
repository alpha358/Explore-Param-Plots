%% ========== Passing cell-array to function insted of variables ===========
% x = {3, 7, 1, 8}
% y = f(x{:})
% % is equivent to the command:
% y = f(3,7,1,8)

%% =============== Assigning multiple variables from array ================
t = num2cell([1,2,3,4]);
[a,b,c,d] = deal(t{:});


%% ========================== Matlab dictionary ===========================
paramValues =  containers.Map();
paramValues('a') = 1:4;
paramValues('b') = 1:4;
paramValues('c') = 1:4;
