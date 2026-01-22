clc;
clear;

% Define the function f(u)
f = @(u) u.^4 ./ (1 + u.^6);

% Create N = floor(10^x) for x = 1, 1.1, ..., 5
x_vals = 1:0.1:5;
N_vals = floor(10.^x_vals);

E = zeros(length(N_vals),1);   % Store Monte Carlo estimates

% Monte Carlo simulation
for k = 1:length(N_vals)
    N = N_vals(k);
    hits = 0;

    for i = 1:N
        u = rand;   % uniform in [0,1]
        v = rand;   % uniform in [0,1]

        if v <= f(u)
            hits = hits + 1;
        end
    end

    E(k) = hits / N;
end

% "True" value using numerical integration (not Monte Carlo)
I_true = integral(@(u) u.^4 ./ (1 + u.^6), 0, 1);

% Plot results
figure;
plot(N_vals, E, 'o-'); 
hold on;
yline(I_true, '--');
set(gca, 'XScale', 'log');
xlabel('N (log scale)');
ylabel('Estimate E(N)');
legend('Monte Carlo estimate', 'True value');
title('Monte Carlo estimate of the integral');
grid on;
