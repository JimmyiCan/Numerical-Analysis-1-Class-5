lambda = zeros(10,1);
theta = zeros(10,1);
for i = 1:10
    A = K2D(i,5);
    s = size(A);
    b = randn(s(1),1);
    tol = 1e-5;
    L = ichol(A);
    inv_L = L\eye(s(1));
    inv_LT = L'\eye(s(1));
    B = inv_L*A*inv_LT;
    c = inv_L*b;
    lambda(i) = mycg_lambda(B, c, tol);
    theta(i) = mycg_lambda(A, b, tol);
%     iteration(i) = lambda;
    fprintf('\n')
%     x_preconditioner = inv_LT*y_preconditioner;
end
disp(lambda)
disp(theta)
size_matrix = 5:5:50;
plot(size_matrix,theta,'*',size_matrix,lambda,'ok')
legend('Gradient descent iteration','Preconditioning')
xlabel('Size','FontSize',14)
ylabel('Iterations','FontSize',14)
title('Gradient descent iteration count and preconditioning','FontSize',16)
