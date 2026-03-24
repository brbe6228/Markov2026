clear; clc; close all;

P = [0   1   0   0   0;
     1/3 0   2/3 0   0;
     0   1/2 0   1/2 0;
     0   0   2/3 0   1/3;
     0   0   0   1   0];

q0 = [0 0 1 0 0];


q50 = q0 * (P^50);


pi_bar = [1/12 1/4 1/3 1/4 1/12];


disp('q_50 = ');
disp(q50);

disp('pi_bar = ');
disp(pi_bar);

i = 0:4;


figure;
plot(i, q50, '-o', 'LineWidth', 2, 'MarkerSize', 8);
hold on;
plot(i, pi_bar, '-s', 'LineWidth', 2, 'MarkerSize', 8);
grid on;

xlabel('State i');
ylabel('Probability');
title('Comparison of q_{50}(i) and \pi(i)');
legend('q_{50}(i)', '\pi(i)', 'Location', 'best');
xticks(0:4);