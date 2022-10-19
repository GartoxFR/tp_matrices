function [x, n] = gaussseidel(a, b, first, prec, maxIter)
    
    x = first;
    y = x;

    s = size(a);

    disp(s);
    for n=1:maxIter
        for i=1:s(1, 1)
            somme = 0;
            for j=1:s(1, 2)
                somme = somme + a(i, j) * x(j, 1);
            end
            somme = somme - a(i, i) * x(i, 1);
            x(i, 1) = (b(i, 1) - somme) / a(i, i);  
        end

        if norm(a*x - b) < prec
            break;
        end
    end
    
end

