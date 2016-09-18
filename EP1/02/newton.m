function [root, converged] = newton(c,cp,x)
    eps = 10**(-4);
    root = x;
    n = length(c) - 1;
    y = (x.^(n:-1:0))*c';
    while(eps <= abs(y))
        if ((dy = (x.^(n-1:-1:0))*cp') < eps)
            converged = 0;
            return
        end
        x = x - y/dy;
        y = (x.^(n:-1:0))*c';
    end
    root = x;
    converged = 1;
endfunction
