function [ h ] = plot_api( a,b,c )

  h = figure();
  x = linspace(0, 10, 100);
  y = a.*x.^2 + b.*x + c;

  plot(x,y)
  title(['Parabola: a=' num2str(a) ]);
  
end  % plot_api
