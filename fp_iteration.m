function [] = fp_iteration(func, p0, error, max_it)

F = str2func(strcat('@(x)',func));

i = 1;
p = F(p0);
fprintf('i,p,p0 \n');

while (i <= max_it)
    fprintf('%3d,%15.8e,%15.7e \n',i,p,p0);
    i = i+1;
    p = F(p0);
    if(abs(p - p0) < error)
        fprintf('FINAL  p0 =%15.8e with %3d iterations\n',p0, i-1);
        break;
    end
    p0 = p;
    
end
end
