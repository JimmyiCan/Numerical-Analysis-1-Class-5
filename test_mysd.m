function test_mysd()
tol = 1e-10;
for Ix = 1:1000
    for Jy = 1:1000
        A = K2D(Ix, Jy);
        b = 100*randn(Ix*Jy, 1);
        fprintf('%d * %d:',Ix,Jy)
        modified_mysd(A, b, tol);
    end
end
