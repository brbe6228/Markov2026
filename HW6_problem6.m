clear; clc; close all;

N = 1e3;              
sizes = zeros(N,1);

for sim = 1:N
    X = 1;            
    S = 0;            
    
    while X > 0
        S = S + X;   
        Z = binornd(X, 0.5);
        X = 2 * Z;
    end
    
    sizes(sim) = S;
end

p3_hat = mean(sizes == 3);
p3_exact = 1/8;

fprintf('Estimated P(S=3) = %.4f\n', p3_hat);
fprintf('Exact P(S=3)      = %.4f\n', p3_exact);