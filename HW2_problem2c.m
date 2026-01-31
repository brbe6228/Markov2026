clear; clc;

N = 1e6;
X_ar = zeros(N,1);

cstar = 4/exp(1);         
accRate_theory = exp(1)/4; 

tic;
nacc = 0;
ntry = 0;

while nacc < N
    batch = max(1e5, N - nacc); 

    Y = -2*log(rand(batch,1));

    U = rand(batch,1);

    ratio = (exp(1)/2) .* Y .* exp(-Y/2);

    keep = (U <= ratio);
    ykeep = Y(keep);

    m = min(length(ykeep), N - nacc);
    X_ar(nacc+1:nacc+m) = ykeep(1:m);

    nacc = nacc + m;
    ntry = ntry + batch;
end

t_ar = toc;

fprintf('Accept-Reject: accepted=%g, tried=%g, emp acc=%.4f, time=%.3f sec\n', ...
    N, ntry, N/ntry, t_ar);
fprintf('Theoretical acc rate = %.4f\n', accRate_theory);


fprintf('Mean ~ %.6f (true mean=2)\n', mean(X_ar));
fprintf('Var  ~ %.6f (true var =2)\n', var(X_ar,1));