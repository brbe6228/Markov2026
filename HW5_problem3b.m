clear
clc
close all
clear
clc
close all

syms a

A = [1-a,   a,   0;
      a,     0, 1-a;
      0,   1-a,  a];

[V,D] = eig(A);

disp('Eigenvalues:')
disp(diag(D))

disp('Eigenvectors:')
disp(V)

% Set the value of a and redefine matrix A
a = 0.99;   

A = [1-a,  a,   0;
     a,    0, 1-a;
     0,  1-a,  a];

% Compute eigenvalues and eigenvectors
[V,D] = eig(A);

disp('Matrix A =')
disp(A)

disp('Eigenvalues =')
disp(diag(D))

disp('Eigenvectors (columns of V) =')
disp(V)


[~,idx] = min(abs(diag(D)-1));
v1 = V(:,idx);
v1 = real(v1);
v1 = v1 / sum(v1);

disp('Stationary distribution from eigenvector for lambda = 1:')
disp(v1)