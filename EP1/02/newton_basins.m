function newton_basins(f,n)
    eps = 10**(-4)
    dx = 20/n;
    roots = [];

    n  = length(f);
    df = (f.*(n-1:-1:0))(1:end-1);

    fid = fopen('output.txt', 'w');
    for x=(-10:dx:10)
        for y =(-10:dx:10)
            [root, converged] = newton(f, df, x+y*i);
            if(~converged)
                fprintf(fid, '%f %f %d\n', x, y, int32(0));
            else
                k = find(abs(roots-root) < eps, 1);
                if(isempty(k))
                    roots = [roots root];
                    sort(roots);
                    k = int32(length(roots));
                else
                    k = int32(k(1));
                end
                fprintf(fid, '%f %f %d\n', x, y, k);
            end
        end
    end
    k
    fclose(fid);

endfunction
