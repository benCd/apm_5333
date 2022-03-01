function [x,y] = euler_per(x0,y0,x_end,h,p,fcn)
%
% function [x,y]=euler_for(x0,y0,x_end,h,fcn)
%
% Solve the perturbed initial value problem
%    y' = f(x,y),  x0 <= x <= b,  y(x0)=y0 + p
% Use Euler's method with a stepsize of h and perturbation p in each
% iteration.  The user must supply a program with some name, say deriv,
% and a first line of the form
%   function ans=deriv(x,y)
%
% A sample call would be
%   [x,y]=euler_per(x0,y0,b,h,p,'deriv')
%
% Output:
% The routine euler_per will return two vectors, x and y.
% The vector x will contain the node points
%   x(1)=x0, x(j)=x0+(j-1)*h, j=1,2,...,N
% with
%   x(N) <= x_end-h,  x(N)+h > x_end-h
% The vector y will contain the estimates of the solution Y
% at the node points in x.
%
n = fix((x_end-x0)/h)+1;
x = linspace(x0,x0+(n-1)*h,n)';
y = zeros(n,1);
y(1) = y0 + p;
for i = 2:n
    y(i)=y(i-1)+h*fcn(x(i-1),y(i-1))+p;
end