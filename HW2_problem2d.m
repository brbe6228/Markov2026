clear; clc;

N = 1e6;

tic;
E1 = -log(rand(N,1));   
E2 = -log(rand(N,1));   
X  = E1 + E2;           
t_sumexp = toc;

fprintf('Sum of two exponentials: N=%g, time = %.4f sec\n', N, t_sumexp);


fprintf('Sample mean = %.6f (true mean=2)\n', mean(X));
fprintf('Sample var  = %.6f (true var =2)\n', var(X,1));