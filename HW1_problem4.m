clc; clear;

N = 1e4;
X = rand(N,3);
T = max(X,[],2);

figure;
histogram(T,'Normalization','pdf');
hold on;

t = linspace(0,1,500);
plot(t,3*t.^2,'LineWidth',2);

xlabel('t');
ylabel('density');
title('Simulation vs Theory');
legend('Histogram','3t^2');
grid on;
