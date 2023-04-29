alpha = 1.11e-4;
n = 2;
N = 100*n;
v = ones(N,1);
A = spdiags([v,-2*v,v], [-1,0,1],N,N);
bar = zeros(N,1);
bar(23*n) = 0.1;
h = 1/N;
tol = 1e-4;
b = (-1/(alpha*h))*bar;
T = gauss_seidel((1/h.^2)*A, b, tol);
T_true = (1/h.^2)*A\b;
position = linspace(0,1,N);
plot(position,T,'*',position,T_true,'.')
Tmax = max(T(:));
T_true_max = max(T_true(:));
fprintf('The maximum temperature computed using Gauss-Seidel method along the rod is %f.\n',Tmax)
fprintf('The true maximum temperature along the rod is %f.\n',T_true_max)
axis([0 1 0 Tmax])
legend('Gauss-Seidel','Matlab','FontSize',14)
title('Gauss-Seidel','FontSize',16)
xlabel('Position (m)','FontSize',14)
ylabel('Temperature (C)','FontSize',14)

% If alpha is 1.88e-5, the maximum temperature will be 943.421192 when the
% rod is marked with 200 nodes of which any one is 1m/200 far from
% adjacent nodes. 