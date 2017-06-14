function  save_param_plot(h, name, img_name)
%SAVE_PARAM_PLOT Summary of this function goes here
       print(h, '-dpng',[dir '/' name '/XY/' name '_(E_Y)_XY_scale=' num2str(scale) '.png'])

end

