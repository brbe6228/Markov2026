figure; hold on;


histogram(X, 'Normalization','pdf', 'NumBins', 80, 'DisplayName','Samples');


xgrid = linspace(0, max(10, prctile(X,99.9)), 2000);
pdf = xgrid .* exp(-xgrid);

plot(xgrid, pdf, 'LineWidth', 2, 'DisplayName','Theoretical pdf  f(x)=x e^{-x}');

xlabel('x');
ylabel('Density');
title('Gamma(2,1): Histogram vs Theoretical PDF');
legend('Location','northeast');
grid on; hold off;