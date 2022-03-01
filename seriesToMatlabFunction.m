function [func] = seriesToMatlabFunction(seq,n_start, n_end)
syms x;
func = 0;
for k = n_start:n_end
    func = func + seq(k,x);
end
func = matlabFunction(func);
end

