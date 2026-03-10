clear; clc; close all;


a = 0.99;


P = [1-a,   a,   0;
      a,    0, 1-a;
      0,  1-a,  a];


n_max = 300;


N_values = [100, 1000, 10000];

for k = 1:length(N_values)
    N = N_values(k);

    
    f = zeros(n_max+1,1);

    
    for sim = 1:N
        state = 1;              
        counts = zeros(n_max+1,1);
        counts(1) = 1;          

        for n = 1:n_max
            u = rand;

            if state == 1
                if u < (1-a)
                    state = 1;
                else
                    state = 2;
                end

            elseif state == 2
                if u < a
                    state = 1;
                else
                    state = 3;
                end

            elseif state == 3
                if u < (1-a)
                    state = 2;
                else
                    state = 3;
                end
            end

            if state == 1
                counts(n+1) = 1;
            end
        end

        f = f + counts;
    end

   
    f = f / N;

    
    q = zeros(3, n_max+1);
    q(:,1) = [1;0;0];

    for n = 1:n_max
        q(:,n+1) = P' * q(:,n);
    end

    q1_theory = q(1,:);

   
    figure;
    plot(0:n_max, f, 'LineWidth', 1.5);
    hold on;
    plot(0:n_max, q1_theory, 'LineWidth', 1.5);
    yline(1/3, '--');
    xlabel('n');
    ylabel('Probability / Fraction in state 1');
    title(['Markov Chain: N = ', num2str(N), ', a = 0.99']);
    legend('Simulation f_n', 'Theory q_n(1)', 'Stationary value 1/3', ...
           'Location', 'best');
    grid on;
end