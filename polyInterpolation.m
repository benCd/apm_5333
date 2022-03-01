function [F] = polyInterpolation(X,Y)
syms x;
F = 0;
if length(X) ~= length(Y)
    return;
end
for k = 1:length(X)
    temp = 1;
    for i = 1:length(X)
        if i ~= k
            temp = temp*(x-X(i))/(X(k) - X(i));
        end
    end
    F = F + temp*Y(k);
end
F = matlabFunction(F);
end