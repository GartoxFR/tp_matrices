a = zeros(1000, 1000);
for x=0:49
    for y=0:19
        n = y + 20 * x + 1;

        if (y >= 10 && y <= 18 && x == 0)
            a(n, n) = -4;
            a(n, n + 1) = 1;
            a(n, n - 1) = 1;
            a(n, n + 20) = 1;
            a(n, y - 10 + 20 * 49 + 1) = 1;
        elseif (y >= 1 && y <= 9 && x == 49)
            a(n, n) = -4;
            a(n, n + 1) = 1;
            a(n, n - 1) = 1;
            a(n, n - 20) = 1;
            a(n, y + 10 + 1) = 1;
        elseif (x == 0 && y == 19)
            a(n, n) = -3;
            a(n, n - 1) = 1;
            a(n, n + 20) = 1;
            a(n, y - 10 + 20 * 49 + 1) = 1;
        elseif (x == 49 && y == 0)
            a(n, n) = -3;
            a(n, n + 1) = 1;
            a(n, n - 20) = 1;
            a(n, y + 10 + 1) = 1;
        else 
            i = 0;
            for r=-1:2:1
                nx = x + r;
                if (nx >= 0 && nx <= 49)
                    a(n, y + 20 * nx + 1) = 1;
                    i = i + 1;
                end
            end
            
            for r=-1:2:1
                ny = y + r;
                if (ny >= 0 && ny <= 19)
                    a(n, ny + 20 * x + 1) = 1;
                    i = i + 1;
                end
            end
            a(n, n) = -i;
        end
    end
end

dt = 3;
u = zeros(1000, 1);
s = expm(a*dt);

surf(reshape(u, 20, 50));
pause(0.05);
for i=1:1000
    for x=40:42
        for y=6:8
            n = y + 20 * x + 1;
            u(n) = 500;
        end
    end

    lastU = u;
    u = s*u;
    surf(reshape(u, 20, 50));
    pause(0.05);

    if (norm(u - lastU) < 1)
        break;
    end
end
