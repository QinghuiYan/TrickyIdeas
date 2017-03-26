function [ E ] = rot(theta,dim)
%ROT Summary of this function goes here
%   Detailed explanation goes here
E = eye(4);
M=[cos(theta) sin(theta); -sin(theta) cos(theta)];
E(dim,dim) = E(dim,dim)*M;
end

