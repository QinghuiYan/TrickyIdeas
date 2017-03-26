function [ output_args ] = rot( theta, N, a,b)
%ROT Summary of this function goes here
%   Detailed explanation goes here
A=eye(N);
A(a,a)=cos(theta);
A(a,b)=sin(theta);
A(b,a)=-sin(theta);
A(b,b)=cos(theta);
output_args=A;
end

