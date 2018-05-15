function  main_fn( plot_name, paramValues, plot_api_handle)
  % function: Short description
  %
  % Extended description


  %% ======================== Loading required code ========================
  addpath('matlab_part/jsonlab-1.5');
  addpath('matlab_part');

  % plot_name = 'testas';

  %% ========================= Defining Parameters ==========================
  % -------------------- Initializing dictionarys/hashmaps --------------------
  % paramValues =  containers.Map();
  % paramTypes =  containers.Map();

  % TODO: Finish
  %                         1 - Slider,    2 - Select
  % paramTypes('a') = 'slider';
  % paramTypes('b') = 'slider';
  % paramTypes('c') = 'select';






  % ---------- Constructing cartesian product of parameter values -----------
  temp_paramValsCells = paramValues.values;
      paramNamesCells = paramValues.keys;
  % Cartesian product of sets
  paramValuesCartProd = allcomb(temp_paramValsCells{:});
  clear temp_paramValsCells;

  %% ========================= Copy Needed WEB Files =========================
  copyfile('web_part/*', ['results/' plot_name]);

  %% ======================= Save information for JS ========================

  FileName =  ['results/' plot_name '/parameters.json'];

  % Structure for JSON
  dataJSON = struct();
  dataJSON.plot_name = plot_name;
  dataJSON.parameters = map2struct(paramValues);
  
  %TODO: JUST for complex numbers
%   if dataJSON.parameters.epsilon
      dataJSON.parameters.epsilon = ...
          arrayfun( @(x) cellstr(num2str(x)), ...
                        [dataJSON.parameters.epsilon{:}]...
                   );
%   end
  

  savejson('', dataJSON, FileName);

  % ----------------------- writing json as js string -----------------------
  S = fileread(FileName);
  S = ['json_string=`', char(10), S  , '`'];
  FID = fopen(FileName, 'w');
  if FID == -1, error('Cannot open file %s', FileName); end
  fwrite(FID, S, 'char'); fclose(FID);

  %% ============================ Generate plots ============================
  wait_h = waitbar2(0,'Computing Plots');
  % fig = figure();
  fig = figure('units','normalized','outerposition',[0 0 1 1]);

  for n = 1:length(paramValuesCartProd) % go trough all the param values
      waitbar2( n / length(paramValuesCartProd),  wait_h);
      % ------------------- Multiple parameter asignment --------------------
      p = paramValuesCartProd(n,:);

      % Pass an array as an argument list
      set(0, 'currentfigure', fig); clf(fig);
      plot_api_handle(p{:});

      % --------------------------- Save the plot ---------------------------
      img_name = generate_img_name( plot_name,  paramNamesCells, p);
      save_param_plot(fig, plot_name, img_name);
%       save(['results/' plot_name '_last_state.mat'], 'paramValuesCartProd', 'n'); % save last state
  end
  close(wait_h);



end  % main_fn
