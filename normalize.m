function [ var_norm ] = normalize(var)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    var_norm = var/abs(max(var(:)));

end

