clc
clear

a = [10, 1, -7; 2, -16, 4; 15, -1, 20];
b = [1; 3; 4];

% s = 50;
% vals = 0.001;

% a = rand(s, s) * vals;
% a = a + eye(s, s) * s * vals;
% b = rand(s, 1) * vas;
first = zeros(3, 1);

[res, n] = jacobi(a, b, first, 1e-15, 100000);
disp(res)
disp(n)
[res, n] = gaussseidel(a, b, first, 1e-15, 100000);
disp(res)
disp(n)

[res, n] = relax(a, b, first, 1e-15, 100000);
disp(res)
disp(n)

