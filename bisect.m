function [curr, out] = bisect(func, a, b, error)

F = str2func(strcat('@(x)',func));

i = 0;
curr = a+(b-a)/2.0;
FA = F(a);
FB = F(b);
FC = F(curr);

while (abs(FC) > error && i < 200000)
    curr = a+(b-a)/2;
    FC = F(curr);
    fprintf('%3d   %15.8e   %15.7e \n',i,curr,FC);
    if FA*FC > 0
        a = curr;
        FA = FC;
    else
        b = curr;
        FB = FC;
    end
    i = i+1;
end
out = FC;
end

