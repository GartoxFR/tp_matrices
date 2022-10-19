clc
clear 

a = zeros(1000, 1000);
b = zeros(1000, 1);

orange = 300;
blue = 100;
red = 500;

for x=0:49
    for y=0:19
        n = y + 20 * x + 1;

        if (y == 0 || y == 19)
            a(n, n) = 1;
            b(n, 1) = orange;
        elseif(x == 0 || x == 49)
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
            else
                a(n, n) = 1;
                b(n, 1) = orange;
            end
        elseif (x >= 7 && x <= 8 && y >= 4 && y <= 12)
            a(n, n) = 1;
            b(n, 1) = blue;
        elseif (x >= 40 && x <= 42 && y >= 6 && y <= 8)
            a(n, n) = 1;
            b(n, 1) = red;
        else
            a(n, n) = -4;
            a(n, n + 1) = 1;
            a(n, n - 1) = 1;
            a(n, n + 20) = 1;
            a(n, n - 20) = 1;
        end
    end
end


res = gaussseidel(a, b, zeros(1000, 1), 0.1, 100000);

evolution(res, 5, 0.1);
