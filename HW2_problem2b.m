clear; clc;

N = 1e6;
u = rand(N,1);


x = -log(1-u);          
x(x < 0) = 0;

maxIter = 20;
tol = 1e-12;

tic;
for k = 1:maxIter
    ex = exp(-x);

    h  = 1 - (x+1).*ex - u;   
    hp = x.*ex;               

    
    small = (hp < 1e-14);
    hp(small) = 1e-14;

    xnew = x - h./hp;

   
    xnew(xnew < 0) = 0;

    
    if max(abs(xnew - x)) < tol
        x = xnew;
        break;
    end
    x = xnew;
end
t_newton = toc;

X_newton = x;

fprintf('Newton inverse sampling: N=%g, iters=%d, time=%.3f sec\n', N, k, t_newton);

fprintf('Mean ~ %.6f (true mean=2)\n', mean(X_newton));
fprintf('Var  ~ %.6f (true var =2)\n', var(X_newton,1)); 