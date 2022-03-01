function [out] = bisect_from_right(func, a, b, error)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

F = str2func(strcat('@(x)',func));

i = 1;
curr = a+(b-a)/2.0;
FA = F(a);
FB = F(b);
FC = F(curr);

while (abs(FC) > error && i < 200000)
    FC = F(curr);
    b = curr;
    FB = FC;
    i = i+1;
    curr = a+(b-a)/2;
end
out = FC;
end

