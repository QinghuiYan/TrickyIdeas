function [output] = perspecWei(dist,P,dim)
%PERSPEC Summary of this function goes here
%   Detailed explanation goes here
 
 t = 2*dist/(dist-P(dim));
 
 output = P(1:(dim-1))*t;
end