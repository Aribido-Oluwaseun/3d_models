function [ var_norm, norm_coeff ] = normalize(var)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    norm_coeff = abs(max(var(:)));
    var_norm = var/norm_coeff;

end