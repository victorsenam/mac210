function roots = find_all_roots(f,df,a,b,tol,ninter)
    dx = (b-a)/ninter;
    x  = (a:dx:b);
    y  = f(x);
    roots = x(abs(y) < tol);
    for i=(1:ninter)
        if(y(i)*y(1+i) + tol > 0)
            continue
        end
        l = x(i);
        r = x(1+i);
        [root, converged] = newton(f,df,.5*(l+r), tol);
        while(~converged)
            [l,r] = bisect(f,l,r,3);
            [root, converged] = newton(f,df,.5*(l+r), tol);
        end
        roots = [roots root];
    end
endfunction
