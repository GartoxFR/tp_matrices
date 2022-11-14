function [vals, vecs] = propre(A, n)
    s = size(A);
    for i=1:n
        [val, v] = pIter(A);
        [vol, u] = pIter(A.');
        u = u .';
        % disp(val)
        vals(1, i) = val;
        vecs(1:s(1, 1), i) = v;

        A = A - (val / (u * v)) * (v * u);
    end
end

function [val, vec] = pIter(A)
    s = size(A);

    Y = ones(s(1, 1), 1) * 100;
    X = zeros(s(1, 1), 1);
    X(1) = 100;

    while norm(X) * norm(Y) - abs(dot(X, Y)) > 1e-12
        X = Y / norm(Y);
        Y = A * X;
    end

    vec = X;
    i = 1;
    while (X(i) == 0 || Y(i) == 0)
        i = i +1;
    end
    val = Y(i) / X(i);
    % disp(val)

end

