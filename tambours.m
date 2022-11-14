
A = zeros(1000, 1000);
for x=0:49
    for y=0:19
        n = y + 20 * x + 1;

        if x == 0 || x == 49 || (y == 0 && x >= 25) || (y == 19 && x <= 23) || (y >= 7 && y <= 9 && x >= 19 && x <= 29)
            A(n, n) = 1;
        else
            i = 0;
            for r=-1:2:1
                nx = x + r;
                if (nx >= 0 && nx <= 49)
                    A(n, y + 20 * nx + 1) = 1;
                    i = i + 1;
                end
            end
            
            for r=-1:2:1
                ny = y + r;
                if (ny >= 0 && ny <= 19)
                    A(n, ny + 20 * x + 1) = 1;
                    i = i + 1;
                end
            end
            A(n, n) = -i;
        end
    end
end

% disp(A(200:205, 200:205))

[hvals, hvecs] = propre(A, 1);
[lvals, lvecs] = propre(inv(A), 1000);
% lvals = 1 ./ lvals;
disp(hvals(1));
disp(1 / lvals(1000));
surf(reshape(lvecs(:, 1000), 20, 50));
% surf(reshape(hvecs(:, 1), 20, 50));
% for i=1:1000
%     disp("next")
%     surf(reshape(lvecs(:, i), 20, 50));
%     drawnow
%     % pause(0.5)
% end


