clear; clc; close all;


n = 5;
a = 0.04;
b = 0.16;
K = 0.1;
Nsteps = 1e6;   


P = zeros(n,n);

for i = 1:n
   
    if i < n
        p_i = K * exp(a*i);
        P(i,i+1) = p_i;
    else
        p_i = 0;
    end

  
    if i > 1
        q_i = K * exp(b*(i-1));
        P(i,i-1) = q_i;
    else
        q_i = 0;
    end

   
    P(i,i) = 1 - p_i - q_i;
end

disp('Transition matrix P = ')
disp(P)

%% Part (a): theoretical stationary distribution from detailed balance
pi_a = zeros(1,n);

for i = 1:n
    pi_a(i) = exp((a-b)*i*(i-1)/2);
end

pi_a = pi_a / sum(pi_a);

disp('Stationary distribution from detailed balance:')
disp(pi_a)

%% Part (b): stationary distribution from eigenvector of P^T
[V,D] = eig(P');
[~,idx] = min(abs(diag(D)-1));
pi_b = real(V(:,idx))';
pi_b = pi_b / sum(pi_b);


if any(pi_b < 0)
    pi_b = -pi_b;
    pi_b = pi_b / sum(pi_b);
end

disp('Stationary distribution from eigenvector:')
disp(pi_b)

%% Part (c): simulate the Markov chain
X = zeros(1,Nsteps);
X(1) = 1;  
for t = 2:Nsteps
    current_state = X(t-1);
    probs = P(current_state,:);
    r = rand;                
    cum_probs = cumsum(probs); 
    X(t) = find(r <= cum_probs, 1);
end


counts = histcounts(X, 0.5:1:(n+0.5));
pi_sim = counts / Nsteps;

disp('Empirical distribution from simulation:')
disp(pi_sim)

%% Part (c): histogram of simulated fractions
figure;
bar(1:n, pi_sim)
xlabel('State')
ylabel('Fraction of Time')
title('Markov Chain State Occupancy')

%% Part (d): compare simulation with theoretical distributions
figure;
bar(1:n, pi_sim, 0.5)
hold on
plot(1:n, pi_a, 'o-', 'LineWidth', 2, 'MarkerSize', 8)
plot(1:n, pi_b, 's--', 'LineWidth', 2, 'MarkerSize', 8)
hold off

xlabel('State')
ylabel('Probability / Fraction of Time')
title('Simulation vs. Theoretical Stationary Distributions')
legend('Simulation','Detailed Balance','Eigenvector','Location','best')