function [ name ] = generate_img_name( plot_name,  paramNamesCells, p)
%GENERATE_IMG_NAME Summary of this function goes here
% p - parameter values vector
  name = plot_name;
  for n=1:length(p)
    name = [name '_' paramNamesCells{n} '=' num2str(p{n}) ];
  end
  
  % Converting to char array
%   name = cell2mat(name);
end
