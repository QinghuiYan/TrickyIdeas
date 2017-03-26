function [output] = perspec( x0,y0,z0,a0,x1,y1,z1,a1 )
%PERSPEC Summary of this function goes here
%   Detailed explanation goes here
A=[1/x1 1/y0 1/z0 1/a0
    1/x0 1/y1 1/z0 1/a0
    1/x0 1/y0 1/z1 1/a0
    1/x0 1/y0 1/z1 1/a1]';
B=[1 1 1 1];
output=B/A;

end

