function [X,Y] = parametricToData(x,y,t0,t1)
T = linspace(t0,t1);

Xf = matlabFunction(x);
Yf = matlabFunction(y);

X = Xf(T);
Y = Yf(T);
end

