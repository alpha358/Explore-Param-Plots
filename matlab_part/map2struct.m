function [ structure ] = map2struct( map )
%MAP2STRUCT Summary of this function goes here
%   Detailed explanation goes here
    keys = map.keys;
    vals = map.values;
    structure = struct();
    for n = 1:length(keys)
        structure.(keys{n}) = vals{n};
    end
end
