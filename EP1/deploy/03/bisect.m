function [l,r] = bisect(f,a,b,k)
    fa = f(a); fb = f(b);
    if(fa*fb > 0 || k < 1)
        error('Input ill-defined')
    end

    for k=1:k
        p = .5*(a+b);
        fp = f(p);
        if(fa*fp < 0) b = p; fb = fp;
        else          a = p; fa = fp;
        end
    end
    
    l = a; r = b;
endfunction
