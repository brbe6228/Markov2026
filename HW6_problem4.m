clear; clc; close all;

a = 0.49;
N = 1e4;              
maxGen = 200;

extinct_count = 0;

for sim = 1:N
    X = 1;  
    
    for n = 1:maxGen
        if X == 0
            extinct_count = extinct_count + 1;
            break;
        end
        
        Z = binornd(X, 1-a);   % number that reproduce
        X = 2 * Z;             % each reproducing particle has 2 offspring
    end
    
    if X == 0 && n == maxGen
        extinct_count = extinct_count + 1;
    end
end

q_hat = extinct_count / N;
q_theory = a / (1-a);

fprintf('Estimated extinction probability = %.6f\n', q_hat);
fprintf('Theoretical extinction probability = %.6f\n', q_theory);