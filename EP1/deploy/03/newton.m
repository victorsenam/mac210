function [x, flag] = newton(f, df, p, tol)
    x = p;
    lx = x - (1 + tol*(1+abs(x)));
    nf = lf = f(p);
    while(~(flag = has_converged(lx,x,lf,tol)) &&
            0.5*lf < abs(nf)                     )
        lx = x;
        dfx = df(x);
        if (abs(dfx) < tol)
            return;
        end
        x = x - lf/dfx;
        lf = nf;
        nf = f(x);
    end
endfunction
