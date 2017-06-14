function [ fig ] = plot_api( a,b,c )

  fig = figure();
  x = linspace(0, 10, 100);
  y = a.*x.^2 + b.*x ;
  
  plot(x,y)
  title(['Parabola: a=' num2str(a) 'b=' num2str(b)  ' c =' c]);
  
end  % plot_api
