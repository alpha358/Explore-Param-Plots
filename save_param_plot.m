function  save_param_plot(fig, name, img_name)
%SAVE_PARAM_PLOT Summary of this function goes here
   mkdir([name '/']);
   mkdir([name '/img']);
   print(fig, [name '/img/' img_name], '-dpng');
%    TODO: save the figure

end
