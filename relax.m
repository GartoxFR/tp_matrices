function [x, n] = relax(a, b, first, prec, maxIter)

    d = diag(diag(a));
    l = tril(a, -1);
    u = triu(a, 1);

    minro = 1;
    finalw = 0;

    for w=1e-2:1e-2:2-1e-2
        ro = max(abs(eig(inv(d+w*l)*((1-w)*d - w*u))));
        if ro < minro
            minro = ro;
            finalw = w;
        end
    end

    w = finalw;
    p = inv(d+w*l)*((1-w)*d - w*u);
    bet = inv(d + w*l) * w * b;

    x = first;

    for n=1:maxIter
        x = p * x + bet; 

        if norm(a*x - b) < prec
            break;
        end
    end

end
