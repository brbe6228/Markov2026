clear; clc; close all;

gamma = 4;
x0 = 10;

C = (gamma - 1) * x0^(gamma - 1);

Ns = [100, 1000, 10000];

xgrid = linspace(0, 60, 2000);
pdf = zeros(size(xgrid));
mask = (xgrid >= x0);
pdf(mask) = C .* xgrid(mask).^(-gamma);

edges = 0:1:60;

figure; hold on;

for i = 1:length(Ns)
    N = Ns(i);

    U = rand(N,1);
    X = x0 .* (1 - U).^(-1/(gamma - 1));

    Xplot = X(X >= 0 & X <= 60);

    histogram(Xplot, edges, 'Normalization', 'pdf', ...
        'DisplayName', sprintf('N=%d', N));
end


plot(xgrid, pdf, 'LineWidth', 2, 'DisplayName', 'Theoretical pdf');

xlim([0 60]);
ylim([0 inf]);
xlabel('x');
ylabel('Density (area = 1)');
title(sprintf('Power-law sampling: \\gamma=%g, x_0=%g', gamma, x0));
legend('Location','northeast');
grid on;
hold off;