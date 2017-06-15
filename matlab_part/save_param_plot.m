function  save_param_plot(fig, name, img_name)
%SAVE_PARAM_PLOT Summary of this function goes here
  %  mkdir([name '/']);
   mkdir(['results/' name '/img']);
   print(fig, ['results/' name '/img/' img_name], '-dpng');
%    TODO: save the figure

end
