function ans = has_converged(lx, x, f, tol)
    ans = abs(x-lx) < tol*(1 + abs(x)) && abs(f) < tol;
endfunction
